/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_requests_dashboard_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_follow/model/follow_requests_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_component_event.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_component_state.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_repository.dart';
import 'package:flutter/services.dart';

class FollowRequestsDashboardComponentBloc extends Bloc<FollowRequestsDashboardComponentEvent, FollowRequestsDashboardComponentState> {
  final FollowRequestsDashboardRepository? followRequestsDashboardRepository;

  FollowRequestsDashboardComponentBloc({ this.followRequestsDashboardRepository }): super(FollowRequestsDashboardComponentUninitialized());
  @override
  Stream<FollowRequestsDashboardComponentState> mapEventToState(FollowRequestsDashboardComponentEvent event) async* {
    final currentState = state;
    if (event is FetchFollowRequestsDashboardComponent) {
      try {
        if (currentState is FollowRequestsDashboardComponentUninitialized) {
          bool permissionDenied = false;
          final model = await followRequestsDashboardRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield FollowRequestsDashboardComponentPermissionDenied();
          } else {
            if (model != null) {
              yield FollowRequestsDashboardComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield FollowRequestsDashboardComponentError(
                  message: "FollowRequestsDashboard with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield FollowRequestsDashboardComponentError(message: "Unknown error whilst retrieving FollowRequestsDashboard");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

