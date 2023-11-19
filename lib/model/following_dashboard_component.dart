/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_follow/model/following_dashboard_component_bloc.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_component_event.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core_model/model/app_model.dart';

/*
 * AbstractFollowingDashboardComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractFollowingDashboardComponent extends StatelessWidget {
  static String componentName = "followingDashboards";
  final AppModel app;
  final String followingDashboardId;

  /*
   * Construct AbstractFollowingDashboardComponent
   */
  AbstractFollowingDashboardComponent(
      {super.key, required this.app, required this.followingDashboardId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FollowingDashboardComponentBloc>(
      create: (context) => FollowingDashboardComponentBloc(
          followingDashboardRepository:
              followingDashboardRepository(appId: app.documentID)!)
        ..add(FetchFollowingDashboardComponent(id: followingDashboardId)),
      child: _followingDashboardBlockBuilder(context),
    );
  }

  Widget _followingDashboardBlockBuilder(BuildContext context) {
    return BlocBuilder<FollowingDashboardComponentBloc,
        FollowingDashboardComponentState>(builder: (context, state) {
      if (state is FollowingDashboardComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is FollowingDashboardComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is FollowingDashboardComponentError) {
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
  Widget yourWidget(BuildContext context, FollowingDashboardModel value);
}
