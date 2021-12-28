/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_follow/model/invite_dashboard_component_bloc.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_component_event.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_repository.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractInviteDashboardComponent extends StatelessWidget {
  static String componentName = "inviteDashboards";
  final AppModel app;
  final String inviteDashboardId;

  AbstractInviteDashboardComponent({Key? key, required this.app, required this.inviteDashboardId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InviteDashboardComponentBloc> (
          create: (context) => InviteDashboardComponentBloc(
            inviteDashboardRepository: inviteDashboardRepository(appId: app.documentID!)!)
        ..add(FetchInviteDashboardComponent(id: inviteDashboardId)),
      child: _inviteDashboardBlockBuilder(context),
    );
  }

  Widget _inviteDashboardBlockBuilder(BuildContext context) {
    return BlocBuilder<InviteDashboardComponentBloc, InviteDashboardComponentState>(builder: (context, state) {
      if (state is InviteDashboardComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(app: app, title: "Error", content: 'No InviteDashboard defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is InviteDashboardComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is InviteDashboardComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, InviteDashboardModel value);
}

