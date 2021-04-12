/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_component_event.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_component_state.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_repository.dart';
import 'package:flutter/services.dart';

class FollowingDashboardComponentBloc extends Bloc<FollowingDashboardComponentEvent, FollowingDashboardComponentState> {
  final FollowingDashboardRepository? followingDashboardRepository;

  FollowingDashboardComponentBloc({ this.followingDashboardRepository }): super(FollowingDashboardComponentUninitialized());
  @override
  Stream<FollowingDashboardComponentState> mapEventToState(FollowingDashboardComponentEvent event) async* {
    final currentState = state;
    if (event is FetchFollowingDashboardComponent) {
      try {
        if (currentState is FollowingDashboardComponentUninitialized) {
          bool permissionDenied = false;
          final model = await followingDashboardRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield FollowingDashboardComponentPermissionDenied();
          } else {
            if (model != null) {
              yield FollowingDashboardComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield FollowingDashboardComponentError(
                  message: "FollowingDashboard with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield FollowingDashboardComponentError(message: "Unknown error whilst retrieving FollowingDashboard");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

