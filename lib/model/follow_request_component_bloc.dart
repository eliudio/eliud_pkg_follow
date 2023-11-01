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

import 'package:eliud_pkg_follow/model/follow_request_component_event.dart';
import 'package:eliud_pkg_follow/model/follow_request_component_state.dart';
import 'package:eliud_pkg_follow/model/follow_request_repository.dart';


class FollowRequestComponentBloc extends Bloc<FollowRequestComponentEvent, FollowRequestComponentState> {
  final FollowRequestRepository? followRequestRepository;
  StreamSubscription? _followRequestSubscription;

  void _mapLoadFollowRequestComponentUpdateToState(String documentId) {
    _followRequestSubscription?.cancel();
    _followRequestSubscription = followRequestRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(FollowRequestComponentUpdated(value: value));
      }
    });
  }

  FollowRequestComponentBloc({ this.followRequestRepository }): super(FollowRequestComponentUninitialized()) {
    on <FetchFollowRequestComponent> ((event, emit) {
      _mapLoadFollowRequestComponentUpdateToState(event.id!);
    });
    on <FollowRequestComponentUpdated> ((event, emit) {
      emit(FollowRequestComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _followRequestSubscription?.cancel();
    return super.close();
  }

}

