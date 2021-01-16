/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_follow/model/following_repository.dart';
import 'package:eliud_pkg_follow/model/following_list_event.dart';
import 'package:eliud_pkg_follow/model/following_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class FollowingListBloc extends Bloc<FollowingListEvent, FollowingListState> {
  final FollowingRepository _followingRepository;
  StreamSubscription _followingsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  FollowingListBloc(this.accessBloc,{ this.eliudQuery, @required FollowingRepository followingRepository })
      : assert(followingRepository != null),
      _followingRepository = followingRepository,
      super(FollowingListLoading());

  Stream<FollowingListState> _mapLoadFollowingListToState({ String orderBy, bool descending }) async* {
    _followingsListSubscription?.cancel();
    _followingsListSubscription = _followingRepository.listen((list) => add(FollowingListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<FollowingListState> _mapLoadFollowingListWithDetailsToState({ String orderBy, bool descending }) async* {
    _followingsListSubscription?.cancel();
    _followingsListSubscription = _followingRepository.listenWithDetails((list) => add(FollowingListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<FollowingListState> _mapAddFollowingListToState(AddFollowingList event) async* {
    _followingRepository.add(event.value);
  }

  Stream<FollowingListState> _mapUpdateFollowingListToState(UpdateFollowingList event) async* {
    _followingRepository.update(event.value);
  }

  Stream<FollowingListState> _mapDeleteFollowingListToState(DeleteFollowingList event) async* {
    _followingRepository.delete(event.value);
  }

  Stream<FollowingListState> _mapFollowingListUpdatedToState(FollowingListUpdated event) async* {
    yield FollowingListLoaded(values: event.value);
  }


  @override
  Stream<FollowingListState> mapEventToState(FollowingListEvent event) async* {
    final currentState = state;
    if (event is LoadFollowingList) {
      yield* _mapLoadFollowingListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadFollowingListWithDetails) {
      yield* _mapLoadFollowingListWithDetailsToState();
    } else if (event is AddFollowingList) {
      yield* _mapAddFollowingListToState(event);
    } else if (event is UpdateFollowingList) {
      yield* _mapUpdateFollowingListToState(event);
    } else if (event is DeleteFollowingList) {
      yield* _mapDeleteFollowingListToState(event);
    } else if (event is FollowingListUpdated) {
      yield* _mapFollowingListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _followingsListSubscription?.cancel();
    return super.close();
  }

}


