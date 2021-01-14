/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_follow/model/follow_request_repository.dart';
import 'package:eliud_pkg_follow/model/follow_request_list_event.dart';
import 'package:eliud_pkg_follow/model/follow_request_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class FollowRequestListBloc extends Bloc<FollowRequestListEvent, FollowRequestListState> {
  final FollowRequestRepository _followRequestRepository;
  StreamSubscription _followRequestsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  FollowRequestListBloc(this.accessBloc,{ this.eliudQuery, @required FollowRequestRepository followRequestRepository })
      : assert(followRequestRepository != null),
      _followRequestRepository = followRequestRepository,
      super(FollowRequestListLoading());

  Stream<FollowRequestListState> _mapLoadFollowRequestListToState({ String orderBy, bool descending }) async* {
    _followRequestsListSubscription?.cancel();
    _followRequestsListSubscription = _followRequestRepository.listenWithDetails((list) => add(FollowRequestListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<FollowRequestListState> _mapLoadFollowRequestListWithDetailsToState() async* {
    _followRequestsListSubscription?.cancel();
    _followRequestsListSubscription = _followRequestRepository.listenWithDetails((list) => add(FollowRequestListUpdated(value: list)), );
  }

  Stream<FollowRequestListState> _mapAddFollowRequestListToState(AddFollowRequestList event) async* {
    _followRequestRepository.add(event.value);
  }

  Stream<FollowRequestListState> _mapUpdateFollowRequestListToState(UpdateFollowRequestList event) async* {
    _followRequestRepository.update(event.value);
  }

  Stream<FollowRequestListState> _mapDeleteFollowRequestListToState(DeleteFollowRequestList event) async* {
    _followRequestRepository.delete(event.value);
  }

  Stream<FollowRequestListState> _mapFollowRequestListUpdatedToState(FollowRequestListUpdated event) async* {
    yield FollowRequestListLoaded(values: event.value);
  }


  @override
  Stream<FollowRequestListState> mapEventToState(FollowRequestListEvent event) async* {
    final currentState = state;
    if (event is LoadFollowRequestList) {
      yield* _mapLoadFollowRequestListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadFollowRequestListWithDetails) {
      yield* _mapLoadFollowRequestListWithDetailsToState();
    } else if (event is AddFollowRequestList) {
      yield* _mapAddFollowRequestListToState(event);
    } else if (event is UpdateFollowRequestList) {
      yield* _mapUpdateFollowRequestListToState(event);
    } else if (event is DeleteFollowRequestList) {
      yield* _mapDeleteFollowRequestListToState(event);
    } else if (event is FollowRequestListUpdated) {
      yield* _mapFollowRequestListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _followRequestsListSubscription?.cancel();
    return super.close();
  }

}


