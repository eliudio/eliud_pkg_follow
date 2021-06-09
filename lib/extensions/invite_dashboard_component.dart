import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/widgets/message_dialog.dart';
import 'package:eliud_core/tools/widgets/yes_no_dialog.dart';
import 'package:eliud_pkg_etc/tools/formatter/format_helpere.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/follow_request_model.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_component.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_repository.dart';
import 'package:eliud_pkg_follow/tools/follower_helper.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_public_info_list.dart';
import 'package:eliud_core/model/member_public_info_list_bloc.dart';
import 'package:eliud_core/model/member_public_info_list_event.dart';
import 'package:eliud_core/model/member_public_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:eliud_core/tools/widgets/dialog_helper.dart';
import 'package:flutter/cupertino.dart';

/* List (public) members and allow to (try to) follow
 * Steel from Membership
 * A person can not request friendship when he's already friend, or friendship request is pending, i.e. verify the followRequestRepository
 */
class InviteDashboardComponentConstructorDefault
    implements ComponentConstructor {
  Widget createNew({String? id, Map<String, dynamic>? parameters}) {
    return InviteDashboard(id: id);
  }
}

class InviteDashboard extends AbstractInviteDashboardComponent {
  InviteDashboard({String? id}) : super(inviteDashboardID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  static EliudQuery getSubscribedMembers(String appId) {
    return EliudQuery(theConditions: [
      EliudQueryCondition('subscriptionsAsString', arrayContains: appId),
    ]);
  }

  @override
  Widget yourWidget(BuildContext context, InviteDashboardModel? dashboardModel) {
    var state = AccessBloc.getState(context);
    if (state is AppLoaded) {
      var member = state.getMember();
      var appId = state.app.documentID;
      return BlocProvider<MemberPublicInfoListBloc>(
        create: (context) => MemberPublicInfoListBloc(
          eliudQuery: getSubscribedMembers(state.app.documentID!),
          memberPublicInfoRepository:
              memberPublicInfoRepository(appId: AccessBloc.appId(context))!,
        )..add(LoadMemberPublicInfoList()),
        child: FormatHelper.getFormattedPost([MemberPublicInfoListWidget(
            readOnly: true,
            widgetProvider: (value) => widgetProvider(appId, value, member),
            listBackground: BackgroundModel(documentID: "`transparent"))]),
      );
    } else {
      return DelayedCircularProgressIndicator();
    }
  }

  Widget widgetProvider(
      String? appId, MemberPublicInfoModel? value, MemberModel? member) {
    return InviteDashboardItem(appId: appId, value: value, member: member);
  }

  @override
  InviteDashboardRepository getInviteDashboardRepository(BuildContext context) {
    return inviteDashboardRepository(appId: AccessBloc.appId(context))!;
  }
}

class InviteDashboardItem extends StatelessWidget {
  final MemberModel? member;
  final MemberPublicInfoModel? value;
  final String? appId;

  InviteDashboardItem({
    Key? key,
    this.member,
    @required this.value,
    this.appId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget profilePhoto;
    if (value!.photoURL != null) {
      profilePhoto = FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: value!.photoURL!,
      );
    } else {
      profilePhoto = Icon(Icons.person_outline);
    }
    return Dismissible(
        key: Key('__Invite_item_${value!.documentID}'),
        child: ListTile(
            onTap: () {
              openOptions(context, profilePhoto);
            },
            trailing: Container(height: 100, width: 100, child: profilePhoto),
            title: Text(
              value!.name == null ? 'No name' : value!.name!,
            )));
  }

  Future<void> openOptions(BuildContext context, Widget profilePhoto) async {
    if (value!.documentID != member!.documentID) {
      String key = FollowerHelper.getKey(value!.documentID!, member!.documentID!);
      var following = await followingRepository(appId: appId)!.get(key);
      if (following == null) {
        var followRequest =
            await followRequestRepository(appId: appId)!.get(key);
        if (followRequest == null) {
          DialogStatefulWidgetHelper.openIt(
              context,
              YesNoDialog(
                title: "Invite",
                message: "Request to follow this person?",
                yesFunction: () => _invite(context),
                noFunction: () {},
                yesButtonLabel: 'Yes',
                noButtonLabel: 'No',
              ));
        } else {
          if (followRequest.status == FollowRequestStatus.FollowRequestDenied) {
            DialogStatefulWidgetHelper.openIt(
                context,
                YesNoDialog(
                  title: "Invite",
                  message: "Request to follow this person? You've requested this before and this was declined.",
                  yesFunction: () => _invite(context),
                  noFunction: () {},
                  yesButtonLabel: 'Yes',
                  noButtonLabel: 'No',
                ));
          } else {
            if (followRequest.status == FollowRequestStatus.FollowRequestPending) {
              DialogStatefulWidgetHelper.openIt(
                  context,
                  MessageDialog(
                      title: 'Error',
                      message: 'You have already requested to follow this person and the request is pending',
                      yesFunction: () => Navigator.of(context).pop()));
            } else {
              DialogStatefulWidgetHelper.openIt(
                  context,
                  MessageDialog(
                      title: 'Error',
                      message: 'You have already requested to follow this person and this was accepted',
                      yesFunction: () => Navigator.of(context).pop()));
            }
          }
        }
      } else {
        DialogStatefulWidgetHelper.openIt(
            context,
            MessageDialog(
                title: 'Error',
                message: 'You are already following this person',
                yesFunction: () => Navigator.of(context).pop()));
      }
    } else {
      DialogStatefulWidgetHelper.openIt(
          context,
          MessageDialog(
              title: 'Error',
              message: 'This is you. No point following yourself.',
              yesFunction: () => Navigator.of(context).pop()));
    }
  }

  Future<void> _invite(BuildContext context) async {
    Navigator.pop(context);
    var follower =
        await memberPublicInfoRepository(appId: appId)!.get(member!.documentID);
    await followRequestRepository(appId: appId)!.add(FollowRequestModel(
        documentID: FollowerHelper.getKey(value!.documentID!, member!.documentID!),
        appId: appId,
        followed: value,
        follower: follower,
        status: FollowRequestStatus.FollowRequestPending));
  }
}
