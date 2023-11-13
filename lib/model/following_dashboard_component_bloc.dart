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

import 'package:eliud_pkg_follow/model/following_dashboard_component_event.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_component_state.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_repository.dart';

class FollowingDashboardComponentBloc extends Bloc<
    FollowingDashboardComponentEvent, FollowingDashboardComponentState> {
  final FollowingDashboardRepository? followingDashboardRepository;
  StreamSubscription? _followingDashboardSubscription;

  void _mapLoadFollowingDashboardComponentUpdateToState(String documentId) {
    _followingDashboardSubscription?.cancel();
    _followingDashboardSubscription =
        followingDashboardRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(FollowingDashboardComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct FollowingDashboardComponentBloc
   */
  FollowingDashboardComponentBloc({this.followingDashboardRepository})
      : super(FollowingDashboardComponentUninitialized()) {
    on<FetchFollowingDashboardComponent>((event, emit) {
      _mapLoadFollowingDashboardComponentUpdateToState(event.id!);
    });
    on<FollowingDashboardComponentUpdated>((event, emit) {
      emit(FollowingDashboardComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the FollowingDashboardComponentBloc
   */
  @override
  Future<void> close() {
    _followingDashboardSubscription?.cancel();
    return super.close();
  }
}
