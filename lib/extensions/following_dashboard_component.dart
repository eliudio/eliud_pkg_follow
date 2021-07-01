import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_pkg_follow/model/following_list.dart';
import 'package:eliud_pkg_follow/model/following_list_event.dart';
import 'package:eliud_pkg_follow/model/following_model.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_component.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_repository.dart';
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
  Widget createNew({String? id, Map<String, dynamic>? parameters}) {
    return FollowingDashboardComponent(id: id);
  }
}

class FollowingDashboardComponent extends AbstractFollowingDashboardComponent {
  FollowingDashboardComponent({String? id}) : super(followingDashboardID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  Widget yourWidget(
      BuildContext? context, FollowingDashboardModel? dashboardModel) {
    if (context == null) return Text("No context");
    if (dashboardModel == null) return Text("Not dashboard");
    var state = AccessBloc.getState(context);
    if (state is AppLoaded) {
      var appId = state.app.documentID;
      var member = state.getMember();
      if (member == null) return Text("No member");
      return StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .containerStyle()
          .topicContainer(context, children: [
        BlocProvider<FollowingListBloc>(
            create: (context) => FollowingListBloc(
                  eliudQuery: getQuery(dashboardModel, member),
                  detailed: true,
                  followingRepository:
                      followingRepository(appId: AccessBloc.appId(context))!,
                )..add(LoadFollowingList()),
            child: StyleRegistry.registry()
                .styleWithContext(context)
                .frontEndStyle()
                .containerStyle()
                .simpleTopicContainer(
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
      return StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .progressIndicatorStyle()
          .progressIndicator(context);
    }
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
        appId: appId, value: value, followingView: dashboardModel.view);
  }

  @override
  FollowingDashboardRepository getFollowingDashboardRepository(
      BuildContext context) {
    return followingDashboardRepository(appId: AccessBloc.appId(context))!;
  }
}

class FollowingDashboardItem extends StatelessWidget {
  final FollowingModel? value;
  final String? appId;
  final FollowingView? followingView;

  FollowingDashboardItem({
    Key? key,
    this.followingView,
    @required this.value,
    this.appId,
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
    return ListTile(
        onTap: () {
          openOptions(context);
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

    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openAckNackDialog(context, title: title, message: message,
            onSelection: (selectedValue) async {
      Navigator.pop(context);
      if (selectedValue == 0) {
        await followingRepository(appId: appId)!.delete(value!);
      }
    });
  }
}
