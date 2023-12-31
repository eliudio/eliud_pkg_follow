import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_main/model/member_public_info_model.dart';
import 'package:eliud_pkg_etc/tools/member_popup_menu.dart';
import 'package:eliud_pkg_follow_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_list.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_list_bloc.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_list_event.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_model.dart';
import 'package:eliud_pkg_follow_model/model/follow_requests_dashboard_component.dart';
import 'package:eliud_pkg_follow_model/model/follow_requests_dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_pkg_follow_model/model/following_model.dart';
import 'package:eliud_pkg_follow/tools/follower_helper.dart';
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
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return FollowRequestsDashboardComponent(key: key, app: app, id: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await followRequestsDashboardRepository(appId: app.documentID)!.get(id);
}

class FollowRequestsDashboardComponent
    extends AbstractFollowRequestsDashboardComponent {
  FollowRequestsDashboardComponent(
      {super.key, required super.app, required String id})
      : super(followRequestsDashboardId: id);

  @override
  Widget yourWidget(BuildContext context, FollowRequestsDashboardModel? value) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        var appId = app.documentID;
        return topicContainer(app, context, children: [
          BlocProvider<FollowRequestListBloc>(
              create: (context) => FollowRequestListBloc(
                    detailed: true,
                    eliudQuery: FollowPackage.getOpenFollowRequestsQuery(
                        appId, accessState.getMember()!.documentID),
                    followRequestRepository:
                        followRequestRepository(appId: appId)!,
                  )..add(LoadFollowRequestList()),
              child: simpleTopicContainer(
                app,
                context,
                children: ([
                  FollowRequestListWidget(
                      app: app,
                      readOnly: true,
                      widgetProvider: (v) => widgetProvider(app, v!, value!),
                      listBackground: BackgroundModel())
                ]),
              ))
        ]);
      } else {
        return progressIndicator(app, context);
      }
    });
  }

  Widget widgetProvider(AppModel app, FollowRequestModel value,
      FollowRequestsDashboardModel dashboardModel) {
    return FollowRequestsDashboardItem(
        app: app, dashboardModel: dashboardModel, value: value);
  }
}

class FollowRequestsDashboardItem extends StatelessWidget {
  final FollowRequestModel? value;
  final AppModel app;
  final FollowRequestsDashboardModel dashboardModel;

  FollowRequestsDashboardItem({
    super.key,
    required this.value,
    required this.dashboardModel,
    required this.app,
  });

  @override
  Widget build(BuildContext context) {
    if (value == null) return Text("Value is null");
    if (value!.follower == null) return Text("Follower is null");
    var followerId = value!.follower!.documentID;
    var theFuture =
        memberPublicInfoRepository(appId: app.documentID)!.get(followerId);
    return FutureBuilder<MemberPublicInfoModel?>(
        future: theFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            Widget photo;
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
                    app,
                    context,
                    'Follow request',
                    () => openOptions(context),
                    dashboardModel.memberActions,
                    value!.documentID,
                  );
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
        ? 'unknown'
        : value!.follower!.name;
    openAckNackDialog(app, context, '${app.documentID}/_followinvitation',
        title: 'Follow Request',
        ackButtonLabel: 'Accept',
        nackButtonLabel: 'Reject',
        message:
            'This member ${name!} would like to follow you? Do you accept or reject?',
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
      value!.status = FollowRequestStatus.followRequestAccepted;
      await followRequestRepository(appId: app.documentID)!.update(value!);

      if ((value!.followed != null) && (value!.follower != null)) {
        await followingRepository(appId: app.documentID)!.add(FollowingModel(
            documentID: FollowerHelper.getKey(
                value!.followed!.documentID, value!.follower!.documentID),
            appId: app.documentID,
            followed: value!.followed!,
            follower: value!.follower!));
      }
    }
  }

  Future<void> _reject(BuildContext context) async {
    Navigator.pop(context);
    if (value != null) {
      value!.status = FollowRequestStatus.followRequestDenied;
      await followRequestRepository(appId: app.documentID)!.update(value!);
    }
  }
}
