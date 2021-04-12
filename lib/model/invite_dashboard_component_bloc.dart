/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_follow/model/invite_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_component_event.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_component_state.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_repository.dart';
import 'package:flutter/services.dart';

class InviteDashboardComponentBloc extends Bloc<InviteDashboardComponentEvent, InviteDashboardComponentState> {
  final InviteDashboardRepository? inviteDashboardRepository;

  InviteDashboardComponentBloc({ this.inviteDashboardRepository }): super(InviteDashboardComponentUninitialized());
  @override
  Stream<InviteDashboardComponentState> mapEventToState(InviteDashboardComponentEvent event) async* {
    final currentState = state;
    if (event is FetchInviteDashboardComponent) {
      try {
        if (currentState is InviteDashboardComponentUninitialized) {
          bool permissionDenied = false;
          final model = await inviteDashboardRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield InviteDashboardComponentPermissionDenied();
          } else {
            if (model != null) {
              yield InviteDashboardComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield InviteDashboardComponentError(
                  message: "InviteDashboard with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield InviteDashboardComponentError(message: "Unknown error whilst retrieving InviteDashboard");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

