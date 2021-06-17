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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_pkg_follow/model/follow_requests_dashboard_component_bloc.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_component_event.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_repository.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_component_state.dart';

abstract class AbstractFollowRequestsDashboardComponent extends StatelessWidget {
  static String componentName = "followRequestsDashboards";
  final String? followRequestsDashboardID;

  AbstractFollowRequestsDashboardComponent({this.followRequestsDashboardID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FollowRequestsDashboardComponentBloc> (
          create: (context) => FollowRequestsDashboardComponentBloc(
            followRequestsDashboardRepository: getFollowRequestsDashboardRepository(context))
        ..add(FetchFollowRequestsDashboardComponent(id: followRequestsDashboardID)),
      child: _followRequestsDashboardBlockBuilder(context),
    );
  }

  Widget _followRequestsDashboardBlockBuilder(BuildContext context) {
    return BlocBuilder<FollowRequestsDashboardComponentBloc, FollowRequestsDashboardComponentState>(builder: (context, state) {
      if (state is FollowRequestsDashboardComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No FollowRequestsDashboard defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is FollowRequestsDashboardComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is FollowRequestsDashboardComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, FollowRequestsDashboardModel? value);
  Widget alertWidget({ title: String, content: String});
  FollowRequestsDashboardRepository getFollowRequestsDashboardRepository(BuildContext context);
}

