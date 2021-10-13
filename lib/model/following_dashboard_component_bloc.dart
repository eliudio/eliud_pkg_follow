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
  StreamSubscription? _followingDashboardSubscription;

  Stream<FollowingDashboardComponentState> _mapLoadFollowingDashboardComponentUpdateToState(String documentId) async* {
    _followingDashboardSubscription?.cancel();
    _followingDashboardSubscription = followingDashboardRepository!.listenTo(documentId, (value) {
      if (value != null) add(FollowingDashboardComponentUpdated(value: value!));
    });
  }

  FollowingDashboardComponentBloc({ this.followingDashboardRepository }): super(FollowingDashboardComponentUninitialized());

  @override
  Stream<FollowingDashboardComponentState> mapEventToState(FollowingDashboardComponentEvent event) async* {
    final currentState = state;
    if (event is FetchFollowingDashboardComponent) {
      yield* _mapLoadFollowingDashboardComponentUpdateToState(event.id!);
    } else if (event is FollowingDashboardComponentUpdated) {
      yield FollowingDashboardComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _followingDashboardSubscription?.cancel();
    return super.close();
  }

}

