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
  final FollowingRepository? followingRepository;
  StreamSubscription? _followingSubscription;

  Stream<FollowingComponentState> _mapLoadFollowingComponentUpdateToState(String documentId) async* {
    _followingSubscription?.cancel();
    _followingSubscription = followingRepository!.listenTo(documentId, (value) {
      if (value != null) add(FollowingComponentUpdated(value: value!));
    });
  }

  FollowingComponentBloc({ this.followingRepository }): super(FollowingComponentUninitialized());

  @override
  Stream<FollowingComponentState> mapEventToState(FollowingComponentEvent event) async* {
    final currentState = state;
    if (event is FetchFollowingComponent) {
      yield* _mapLoadFollowingComponentUpdateToState(event.id!);
    } else if (event is FollowingComponentUpdated) {
      yield FollowingComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _followingSubscription?.cancel();
    return super.close();
  }

}

