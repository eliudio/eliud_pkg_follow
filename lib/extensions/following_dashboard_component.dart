import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_pkg_etc/tools/member_popup_menu.dart';
import 'package:eliud_pkg_follow/model/following_list.dart';
import 'package:eliud_pkg_follow/model/following_list_event.dart';
import 'package:eliud_pkg_follow/model/following_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_component.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/following_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

/*
 * Dashboard of following items, i.e list the entries in 'following', and depending on 'view':
 *   - when view = 'Followers' then where followed = this member
 *   - when view = 'Following' then where follower = this member
 * One should be able to delete an entry, ie. remove a follower or remove a person you follow.
 */
class FollowingDashboardComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key, required String appId, required String id, Map<String, dynamic>? parameters}) {
    return FollowingDashboardComponent(key: key, appId: appId, id: id);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async =>
      await followingDashboardRepository(appId: appId)!.get(id);
}

class FollowingDashboardComponent extends AbstractFollowingDashboardComponent {
  FollowingDashboardComponent({Key? key, required String appId, required String id})
      : super(key: key, theAppId: appId, followingDashboardId: id);

  @override
  Widget yourWidget(
      BuildContext context, FollowingDashboardModel? dashboardModel) {
    if (dashboardModel == null) return Text("Not dashboard");
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        var appId = accessState.currentApp.documentID;
        var member = accessState.getMember();
        if (member == null) return Text("No member");
        return topicContainer(context, children: [
          BlocProvider<FollowingListBloc>(
              create: (context) => FollowingListBloc(
                    eliudQuery: getQuery(dashboardModel, member),
                    detailed: true,
                    followingRepository:
                        followingRepository(appId: appId)!,
                  )..add(LoadFollowingList()),
              child: simpleTopicContainer(
                context,
                children: ([
                  FollowingListWidget(
                      readOnly: true,
                      widgetProvider: (value) =>
                          widgetProvider(appId!, value!, dashboardModel),
                      listBackground:
                          BackgroundModel(documentID: "`transparent"))
                ]),
              ))
        ]);
      } else {
        return progressIndicator(context);
      }
    });
  }

  static EliudQuery? getQuery(
      FollowingDashboardModel followingDashboardModel, MemberModel member) {
    if (followingDashboardModel.view == FollowingView.Followers) {
      return EliudQuery(theConditions: [
        EliudQueryCondition('followedId', isEqualTo: member.documentID),
      ]);
    } else if (followingDashboardModel.view == FollowingView.Following) {
      return EliudQuery(theConditions: [
        EliudQueryCondition('followerId', isEqualTo: member.documentID),
      ]);
    }
    return null;
  }

  Widget widgetProvider(String appId, FollowingModel value,
      FollowingDashboardModel dashboardModel) {
    return FollowingDashboardItem(
        appId: appId,
        value: value,
        followingView: dashboardModel.view,
        dashboardModel: dashboardModel);
  }
}

class FollowingDashboardItem extends StatelessWidget {
  final FollowingModel? value;
  final String appId;
  final FollowingView? followingView;
  final FollowingDashboardModel dashboardModel;

  FollowingDashboardItem({
    Key? key,
    this.followingView,
    required this.value,
    required this.appId,
    required this.dashboardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*
    return FutureBuilder<MemberPublicInfoModel>(
        future: memberPublicInfoRepository(appId: appId)
            .get(value.follower.documentID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
*/
    var data = followingView == FollowingView.Followers
        ? value!.follower
        : value!.followed;
    var photo;
    var name;
    if (data == null) {
      photo = Text("No photo provided");
      name = "No name";
    } else {
      photo = FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: data.photoURL!,
      );
      name = data.name;
    }
    var memberId = followingView == FollowingView.Followers
        ? value!.follower!.documentID!
        : value!.followed!.documentID!;
    return ListTile(
        onTap: () {
          MemberPopupMenu.showPopupMenuWithAllActions(
            context,
            followingView == FollowingView.Followers
                ? 'Reject follow request'
                : 'Unfollow member',
            () => openOptions(context),
            dashboardModel.memberActions,
            memberId,
          );
        },
        trailing: Container(
          height: 100,
          width: 100,
          child: photo,
        ),
        title: Text(
          name,
        ));
    /*} else {
            return Icon(Icons.person_outline);

          }
        });*/
  }

  void openOptions(BuildContext context) {
    var title;
    var message;
    if (followingView == FollowingView.Followers) {
      title = 'Reject follower?';
      message = 'Would you like to reject ' +
          ((value == null) ||
                  (value!.follower == null) ||
                  (value!.follower!.name == null)
              ? value!.follower!.name!
              : '');
    } else {
      title = 'Unfollow this person?';
      message = "Would you like to unfollow " +
          ((value == null) ||
                  (value!.followed == null) ||
                  (value!.followed!.name == null)
              ? value!.followed!.name!
              : '');
    }

    openAckNackDialog(context, appId + '/follow', title: title, message: message,
        onSelection: (selectedValue) async {
      Navigator.pop(context);
      if (selectedValue == 0) {
        await followingRepository(appId: appId)!.delete(value!);
      }
    });
  }
}
