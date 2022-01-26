import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_etc/tools/member_popup_menu.dart';
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
import 'package:flutter/cupertino.dart';

/* List (public) members and allow to (try to) follow
 * Steel from Membership
 * A person can not request friendship when he's already friend, or friendship request is pending, i.e. verify the followRequestRepository
 */
class InviteDashboardComponentConstructorDefault
    implements ComponentConstructor {
  Widget createNew(
      {Key? key, required AppModel app, required String id, Map<String, dynamic>? parameters}) {
    return InviteDashboard(key: key, app: app, id: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await inviteDashboardRepository(appId: app.documentID!)!.get(id);
}

class InviteDashboard extends AbstractInviteDashboardComponent {
  InviteDashboard({Key? key, required AppModel app, required String id})
      : super(key: key, app: app, inviteDashboardId: id);

  static EliudQuery getSubscribedMembers(String appId) {
    return EliudQuery(theConditions: [
      EliudQueryCondition('subscriptionsAsStrArr', arrayContains: appId),
    ]);
  }

  @override
  Widget yourWidget(
      BuildContext context, InviteDashboardModel? dashboardModel) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        var member = accessState.getMember();
        var appId = app.documentID!;
        return topicContainer(app, context, children: [
          BlocProvider<MemberPublicInfoListBloc>(
            create: (context) => MemberPublicInfoListBloc(
              eliudQuery: getSubscribedMembers(appId),
              memberPublicInfoRepository:
                  memberPublicInfoRepository(appId: appId)!,
            )..add(LoadMemberPublicInfoList()),
            child: simpleTopicContainer(app, context, children: [
              MemberPublicInfoListWidget(
                app: app,
                  readOnly: true,
                  widgetProvider: (value) =>
                      widgetProvider(app, value, member, dashboardModel!),
                  listBackground: BackgroundModel(documentID: "`transparent"))
            ]),
          )
        ]);
      } else {
        return progressIndicator(app, context);
      }
    });
  }

  Widget widgetProvider(AppModel app, MemberPublicInfoModel? value,
      MemberModel? member, InviteDashboardModel dashboardModel) {
    return InviteDashboardItem(
      app: app,
      value: value,
      member: member,
      dashboardModel: dashboardModel,
    );
  }
}

class InviteDashboardItem extends StatelessWidget {
  final MemberModel? member;
  final MemberPublicInfoModel? value;
  final AppModel app;
  final InviteDashboardModel dashboardModel;

  InviteDashboardItem({
    Key? key,
    this.member,
    required this.value,
    required this.app,
    required this.dashboardModel,
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
              MemberPopupMenu.showPopupMenuWithAllActions(app,
                context,
                'Request to follow',
                () => openOptions(context, profilePhoto),
                dashboardModel.memberActions,
                value!.documentID!,
              );
            },
            trailing: Container(height: 100, width: 100, child: profilePhoto),
            title: Text(
              value!.name == null ? 'No name' : value!.name!,
            )));
  }

  Future<void> openOptions(BuildContext context, Widget profilePhoto) async {
    if (value!.documentID != member!.documentID) {
      String key =
          FollowerHelper.getKey(value!.documentID!, member!.documentID!);
      var following = await followingRepository(appId: app.documentID)!.get(key);
      if (following == null) {
        var followRequest =
            await followRequestRepository(appId: app.documentID!)!.get(key);
        if ((followRequest == null) || (followRequest.status == FollowRequestStatus.FollowRequestAccepted)) {
          // allow to re-request to follow, if the follower has removed the follower but accepted in the past
          openAckNackDialog(app, context, app.documentID! + '/requestfollow',
              title: 'Request to follow',
              message: 'Request to follow this person?', onSelection: (value) {
            if (value == 0) {
              _invite(context);
            }
          });
        } else {
          if (followRequest.status == FollowRequestStatus.FollowRequestDenied) {
            openAckNackDialog(app, context, app.documentID! + '/invite',
                title: 'Request to follow',
                message:
                    "Request to follow this person? You've requested this before and this was declined.",
                onSelection: (value) {
              if (value == 0) {
                _invite(context);
              }
            });
          } else {
            if (followRequest.status ==
                FollowRequestStatus.FollowRequestPending) {
              openErrorDialog(app, context, app.documentID! + '/_error',
                  title: 'Error',
                  errorMessage:
                      "You have already requested to follow this person and the request is pending.");
/*
            } else {
              openErrorDialog(app, context, app.documentID! + '/_error',
                  title: 'Error',
                  errorMessage:
                      "You have already requested to follow this person and this was accepted.");
*/
            }
          }
        }
      } else {
        openErrorDialog(app, context, app.documentID! + '/_error',
            title: 'Error',
            errorMessage: 'You are already following this person');
      }
    } else {
      openErrorDialog(app, context, app.documentID! + '/_error',
          title: 'Error',
          errorMessage: 'This is you. No point following yourself');
    }
  }

  Future<void> _invite(BuildContext context) async {
    var follower =
        await memberPublicInfoRepository(appId: app.documentID!)!.get(member!.documentID);
    await followRequestRepository(appId: app.documentID!)!.add(FollowRequestModel(
        documentID:
            FollowerHelper.getKey(value!.documentID!, member!.documentID!),
        appId: app.documentID!,
        followed: value,
        follower: follower,
        status: FollowRequestStatus.FollowRequestPending));
  }
}
