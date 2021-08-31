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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_pkg_follow/model/invite_dashboard_component_bloc.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_component_event.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_repository.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_component_state.dart';

abstract class AbstractInviteDashboardComponent extends StatelessWidget {
  static String componentName = "inviteDashboards";
  final String? inviteDashboardID;

  AbstractInviteDashboardComponent({Key? key, this.inviteDashboardID}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InviteDashboardComponentBloc> (
          create: (context) => InviteDashboardComponentBloc(
            inviteDashboardRepository: getInviteDashboardRepository(context))
        ..add(FetchInviteDashboardComponent(id: inviteDashboardID)),
      child: _inviteDashboardBlockBuilder(context),
    );
  }

  Widget _inviteDashboardBlockBuilder(BuildContext context) {
    return BlocBuilder<InviteDashboardComponentBloc, InviteDashboardComponentState>(builder: (context, state) {
      if (state is InviteDashboardComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No InviteDashboard defined');
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
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, InviteDashboardModel? value);
  Widget alertWidget({ title: String, content: String});
  InviteDashboardRepository getInviteDashboardRepository(BuildContext context);
}

