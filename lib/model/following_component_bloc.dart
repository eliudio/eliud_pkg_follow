/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_follow/model/following_model.dart';
import 'package:eliud_pkg_follow/model/following_component_event.dart';
import 'package:eliud_pkg_follow/model/following_component_state.dart';
import 'package:eliud_pkg_follow/model/following_repository.dart';
import 'package:flutter/services.dart';


class FollowingComponentBloc extends Bloc<FollowingComponentEvent, FollowingComponentState> {
  final FollowingRepository followingRepository;

  FollowingComponentBloc({ this.followingRepository }): super(FollowingComponentUninitialized());
  @override
  Stream<FollowingComponentState> mapEventToState(FollowingComponentEvent event) async* {
    final currentState = state;
    if (event is FetchFollowingComponent) {
      try {
        if (currentState is FollowingComponentUninitialized) {
          bool permissionDenied = false;
          final model = await followingRepository.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield FollowingComponentPermissionDenied();
          } else {
            if (model != null) {
              yield FollowingComponentLoaded(value: model);
            } else {
              String id = event.id;
              yield FollowingComponentError(
                  message: "Following with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield FollowingComponentError(message: "Unknown error whilst retrieving Following");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

