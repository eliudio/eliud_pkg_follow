import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
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
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/tools/widgets/dialog_helper.dart';
import 'package:eliud_pkg_follow/model/following_model.dart';
import 'package:eliud_pkg_follow/tools/follower_helper.dart';
import 'package:eliud_pkg_membership/model/member_public_info_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:eliud_pkg_membership/model/abstract_repository_singleton.dart';

import '../follow_package.dart';

/*
 * Dashboard to list the open FollowRequest, which are to be approved or declined by the followed.
 * This is also the list that's being monitored and pops up a nice icon if follow requests are available to be reviewed, resulting to this list
 * When we accept a follow request, we create a following entry and update the status of the followrequest to FollowRequestAccepted
 * When we decline a follow request, we update the status of the followrequest and set the status to FollowRequestDenied
 */
class FollowRequestsDashboardComponentConstructorDefault
    implements ComponentConstructor {
  Widget createNew({String id, Map<String, Object> parameters}) {
    return FollowRequestsDashboardComponent(id: id);
  }
}

class FollowRequestsDashboardComponent
    extends AbstractFollowRequestsDashboardComponent {
  FollowRequestsDashboardComponent({String id})
      : super(followRequestsDashboardID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  Widget yourWidget(
      BuildContext context, FollowRequestsDashboardModel dashboardModel) {
    var state = AccessBloc.getState(context);
    if (state is AppLoaded) {
      var appId = state.app.documentID;
      return BlocProvider<FollowRequestListBloc>(
        create: (context) => FollowRequestListBloc(
          detailed: true,
          eliudQuery: FollowPackage.getOpenFollowRequestsQuery(
              state.app.documentID, state.getMember().documentID),
          followRequestRepository:
              followRequestRepository(appId: AccessBloc.appId(context)),
        )..add(LoadFollowRequestList()),
        child: FollowRequestListWidget(
            readOnly: true,
            widgetProvider: (value) => widgetProvider(appId, value),
            listBackground: BackgroundModel(documentID: "`transparent")),
      );
    } else {
      return DelayedCircularProgressIndicator();
    }
  }

  Widget widgetProvider(String appId, FollowRequestModel value) {
    return FollowRequestsDashboardItem(appId: appId, value: value);
  }

  @override
  FollowRequestsDashboardRepository getFollowRequestsDashboardRepository(
      BuildContext context) {
    return followRequestsDashboardRepository(appId: AccessBloc.appId(context));
  }
}

class FollowRequestsDashboardItem extends StatelessWidget {
  final FollowRequestModel value;
  final String appId;

  FollowRequestsDashboardItem({
    Key key,
    @required this.value,
    this.appId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MemberPublicInfoModel>(
        future: memberPublicInfoRepository(appId: appId)
            .get(value.follower.documentID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListTile(
                onTap: () {
                  openOptions(context);
                },
                trailing: Container(
                    height: 100,
                    width: 100,
                    child: AbstractPlatform.platform
                        .getImageFromURL(url: data.photoURL)),
                title: Text(
                  data.name,
                ));
          } else {
            return Icon(Icons.person_outline);
          }
        });
  }

  void openOptions(BuildContext context) {
    DialogStatefulWidgetHelper.openIt(
        context,
        YesNoDialog(
          title: 'Follow invitation',
          message: 'This member ' +
              value.follower.name +
              ' would like to follow you? Do you accept or reject?',
          yesFunction: () => _accept(context),
          noFunction: () => _reject(context),
          yesButtonLabel: 'Accept',
          noButtonLabel: 'Reject',
        ));
  }

  Future<void> _accept(BuildContext context) async {
    Navigator.pop(context);
    value.status = FollowRequestStatus.FollowRequestAccepted;
    await followRequestRepository(appId: appId).update(value);

    await followingRepository(appId: appId).add(FollowingModel(
        documentID: FollowerHelper.getKey(
            value.followed.documentID, value.follower.documentID),
        appId: appId,
        followed: value.followed,
        follower: value.follower));
  }
  
  Future<void> _reject(BuildContext context) async {
    Navigator.pop(context);
    value.status = FollowRequestStatus.FollowRequestDenied;
    await followRequestRepository(appId: appId).update(value);
  }
}
