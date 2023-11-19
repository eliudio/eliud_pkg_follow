/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_requests_dashboard_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_follow/model/follow_requests_dashboard_component_bloc.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_component_event.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core_model/model/app_model.dart';

/*
 * AbstractFollowRequestsDashboardComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractFollowRequestsDashboardComponent
    extends StatelessWidget {
  static String componentName = "followRequestsDashboards";
  final AppModel app;
  final String followRequestsDashboardId;

  /*
   * Construct AbstractFollowRequestsDashboardComponent
   */
  AbstractFollowRequestsDashboardComponent(
      {super.key, required this.app, required this.followRequestsDashboardId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FollowRequestsDashboardComponentBloc>(
      create: (context) => FollowRequestsDashboardComponentBloc(
          followRequestsDashboardRepository:
              followRequestsDashboardRepository(appId: app.documentID)!)
        ..add(FetchFollowRequestsDashboardComponent(
            id: followRequestsDashboardId)),
      child: _followRequestsDashboardBlockBuilder(context),
    );
  }

  Widget _followRequestsDashboardBlockBuilder(BuildContext context) {
    return BlocBuilder<FollowRequestsDashboardComponentBloc,
        FollowRequestsDashboardComponentState>(builder: (context, state) {
      if (state is FollowRequestsDashboardComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is FollowRequestsDashboardComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is FollowRequestsDashboardComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context),
        );
      }
    });
  }

  /*
   * Implement this method to provide your widget
   */
  Widget yourWidget(BuildContext context, FollowRequestsDashboardModel value);
}
