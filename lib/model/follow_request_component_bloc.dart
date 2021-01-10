/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_follow/model/follow_request_model.dart';
import 'package:eliud_pkg_follow/model/follow_request_component_event.dart';
import 'package:eliud_pkg_follow/model/follow_request_component_state.dart';
import 'package:eliud_pkg_follow/model/follow_request_repository.dart';
import 'package:flutter/services.dart';


class FollowRequestComponentBloc extends Bloc<FollowRequestComponentEvent, FollowRequestComponentState> {
  final FollowRequestRepository followRequestRepository;

  FollowRequestComponentBloc({ this.followRequestRepository }): super(FollowRequestComponentUninitialized());
  @override
  Stream<FollowRequestComponentState> mapEventToState(FollowRequestComponentEvent event) async* {
    final currentState = state;
    if (event is FetchFollowRequestComponent) {
      try {
        if (currentState is FollowRequestComponentUninitialized) {
          bool permissionDenied = false;
          final model = await followRequestRepository.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield FollowRequestComponentPermissionDenied();
          } else {
            if (model != null) {
              yield FollowRequestComponentLoaded(value: model);
            } else {
              String id = event.id;
              yield FollowRequestComponentError(
                  message: "FollowRequest with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield FollowRequestComponentError(message: "Unknown error whilst retrieving FollowRequest");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

