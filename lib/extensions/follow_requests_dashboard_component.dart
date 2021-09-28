import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_etc/tools/member_popup_menu.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/follow_request_list.dart';
import 'package:eliud_pkg_follow/model/follow_request_list_bloc.dart';
import 'package:eliud_pkg_follow/model/follow_request_list_event.dart';
import 'package:eliud_pkg_follow/model/follow_request_model.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_component.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_pkg_follow/model/following_model.dart';
import 'package:eliud_pkg_follow/tools/follower_helper.dart';
import 'package:eliud_core/model/member_public_info_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:transparent_image/transparent_image.dart';
import '../follow_package.dart';

/*
 * Dashboard to list the open FollowRequest, which are to be approved or declined by the followed.
 * This is also the list that's being monitored and pops up a nice icon if follow requests are available to be reviewed, resulting to this list
 * When we accept a follow request, we create a following entry and update the status of the followrequest to FollowRequestAccepted
 * When we decline a follow request, we update the status of the followrequest and set the status to FollowRequestDenied
 */
class FollowRequestsDashboardComponentConstructorDefault
    implements ComponentConstructor {
  Widget createNew({Key? key, required String id, Map<String, dynamic>? parameters}) {
    return FollowRequestsDashboardComponent(key: key, id: id);
  }
}

class FollowRequestsDashboardComponent
    extends AbstractFollowRequestsDashboardComponent {
  FollowRequestsDashboardComponent({Key? key, required String id})
      : super(key: key, followRequestsDashboardID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  Widget yourWidget(
      BuildContext context, FollowRequestsDashboardModel? dashboardModel) {
    var state = AccessBloc.getState(context);
    if (state is AppLoaded) {
      var appId = state.app.documentID;
      return topicContainer(context, children: [
        BlocProvider<FollowRequestListBloc>(
            create: (context) => FollowRequestListBloc(
                  detailed: true,
                  eliudQuery: FollowPackage.getOpenFollowRequestsQuery(
                      state.app.documentID!, state.getMember()!.documentID!),
                  followRequestRepository: followRequestRepository(
                      appId: AccessBloc.appId(context))!,
                )..add(LoadFollowRequestList()),
            child: simpleTopicContainer(
                  context,
                  children: ([
                    FollowRequestListWidget(
                        readOnly: true,
                        widgetProvider: (value) =>
                            widgetProvider(appId!, value!, dashboardModel!),
                        listBackground:
                            BackgroundModel(documentID: "`transparent"))
                  ]),
                ))
      ]);
    } else {
      return progressIndicator(context);
    }
  }

  Widget widgetProvider(String appId, FollowRequestModel value, FollowRequestsDashboardModel dashboardModel) {
    return FollowRequestsDashboardItem(appId: appId, dashboardModel: dashboardModel,value: value);
  }

  @override
  FollowRequestsDashboardRepository getFollowRequestsDashboardRepository(
      BuildContext context) {
    return followRequestsDashboardRepository(appId: AccessBloc.appId(context))!;
  }
}

class FollowRequestsDashboardItem extends StatelessWidget {
  final FollowRequestModel? value;
  final String? appId;
  final FollowRequestsDashboardModel dashboardModel;

  FollowRequestsDashboardItem({
    Key? key,
    required this.value,
    required this.dashboardModel,
    this.appId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (value == null) return Text("Value is null");
    if (value!.follower == null) return Text("Follower is null");
    var followerId = value!.follower!.documentID!;
    var theFuture = memberPublicInfoRepository(appId: appId)!.get(followerId);
    return FutureBuilder<MemberPublicInfoModel?>(
        future: theFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            var photo;
            if (data == null) {
              photo = Text("No photo provided");
            } else {
              photo = FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: data.photoURL!,
              );
            }
            return ListTile(
                onTap: () {
                  MemberPopupMenu.showPopupMenuWithAllActions(
                      context, 'Follow request', () => openOptions(context), dashboardModel.memberActions, value!.documentID!, );
                },
                trailing: Container(
                  height: 100,
                  width: 100,
                  child: photo,
                ),
                title: Text(
                  data!.name!,
                ));
          } else {
            return Icon(Icons.person_outline);
          }
        });
  }

  void openOptions(BuildContext context) {
    var name = value == null ||
            value!.follower == null ||
            value!.follower!.name == null
        ? "unkown"
        : value!.follower!.name;
    openAckNackDialog(context,
            title: 'Follow invitation',
            ackButtonLabel: 'Accept',
            nackButtonLabel: 'Reject',
            message: 'This member ' +
                name! +
                ' would like to follow you? Do you accept or reject?',
            onSelection: (value) {
      if (value == 0) {
        _accept(context);
      } else {
        _reject(context);
      }
    });
  }

  Future<void> _accept(BuildContext context) async {
    Navigator.pop(context);
    if (value != null) {
      value!.status = FollowRequestStatus.FollowRequestAccepted;
      await followRequestRepository(appId: appId)!.update(value!);

      if ((value!.followed != null) && (value!.follower != null)) {
        await followingRepository(appId: appId)!.add(FollowingModel(
            documentID: FollowerHelper.getKey(
                value!.followed!.documentID!, value!.follower!.documentID!),
            appId: appId,
            followed: value!.followed!,
            follower: value!.follower!));
      }
    }
  }

  Future<void> _reject(BuildContext context) async {
    Navigator.pop(context);
    if (value != null) {
      value!.status = FollowRequestStatus.FollowRequestDenied;
      await followRequestRepository(appId: appId)!.update(value!);
    }
  }
}
