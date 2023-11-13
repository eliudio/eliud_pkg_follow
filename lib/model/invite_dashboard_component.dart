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
import 'package:eliud_pkg_follow/model/invite_dashboard_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

/*
 * AbstractInviteDashboardComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractInviteDashboardComponent extends StatelessWidget {
  static String componentName = "inviteDashboards";
  final AppModel app;
  final String inviteDashboardId;

  /*
   * Construct AbstractInviteDashboardComponent
   */
  AbstractInviteDashboardComponent(
      {super.key, required this.app, required this.inviteDashboardId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InviteDashboardComponentBloc>(
      create: (context) => InviteDashboardComponentBloc(
          inviteDashboardRepository:
              inviteDashboardRepository(appId: app.documentID)!)
        ..add(FetchInviteDashboardComponent(id: inviteDashboardId)),
      child: _inviteDashboardBlockBuilder(context),
    );
  }

  Widget _inviteDashboardBlockBuilder(BuildContext context) {
    return BlocBuilder<InviteDashboardComponentBloc,
        InviteDashboardComponentState>(builder: (context, state) {
      if (state is InviteDashboardComponentLoaded) {
        return yourWidget(context, state.value);
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
  Widget yourWidget(BuildContext context, InviteDashboardModel value);
}
