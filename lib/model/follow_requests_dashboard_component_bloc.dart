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
  StreamSubscription? _followRequestsDashboardSubscription;

  Stream<FollowRequestsDashboardComponentState> _mapLoadFollowRequestsDashboardComponentUpdateToState(String documentId) async* {
    _followRequestsDashboardSubscription?.cancel();
    _followRequestsDashboardSubscription = followRequestsDashboardRepository!.listenTo(documentId, (value) {
      if (value != null) add(FollowRequestsDashboardComponentUpdated(value: value!));
    });
  }

  FollowRequestsDashboardComponentBloc({ this.followRequestsDashboardRepository }): super(FollowRequestsDashboardComponentUninitialized());

  @override
  Stream<FollowRequestsDashboardComponentState> mapEventToState(FollowRequestsDashboardComponentEvent event) async* {
    final currentState = state;
    if (event is FetchFollowRequestsDashboardComponent) {
      yield* _mapLoadFollowRequestsDashboardComponentUpdateToState(event.id!);
    } else if (event is FollowRequestsDashboardComponentUpdated) {
      yield FollowRequestsDashboardComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _followRequestsDashboardSubscription?.cancel();
    return super.close();
  }

}

