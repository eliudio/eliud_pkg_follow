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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_pkg_follow/model/following_dashboard_component_bloc.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_component_event.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_repository.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_component_state.dart';

abstract class AbstractFollowingDashboardComponent extends StatelessWidget {
  static String componentName = "followingDashboards";
  final String? followingDashboardID;

  AbstractFollowingDashboardComponent({this.followingDashboardID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FollowingDashboardComponentBloc> (
          create: (context) => FollowingDashboardComponentBloc(
            followingDashboardRepository: getFollowingDashboardRepository(context))
        ..add(FetchFollowingDashboardComponent(id: followingDashboardID)),
      child: _followingDashboardBlockBuilder(context),
    );
  }

  Widget _followingDashboardBlockBuilder(BuildContext context) {
    return BlocBuilder<FollowingDashboardComponentBloc, FollowingDashboardComponentState>(builder: (context, state) {
      if (state is FollowingDashboardComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No FollowingDashboard defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is FollowingDashboardComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is FollowingDashboardComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, FollowingDashboardModel? value);
  Widget alertWidget({ title: String, content: String});
  FollowingDashboardRepository getFollowingDashboardRepository(BuildContext context);
}

