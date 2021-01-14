/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_follow/model/following_dashboard_repository.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_list_event.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class FollowingDashboardListBloc extends Bloc<FollowingDashboardListEvent, FollowingDashboardListState> {
  final FollowingDashboardRepository _followingDashboardRepository;
  StreamSubscription _followingDashboardsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  FollowingDashboardListBloc(this.accessBloc,{ this.eliudQuery, @required FollowingDashboardRepository followingDashboardRepository })
      : assert(followingDashboardRepository != null),
      _followingDashboardRepository = followingDashboardRepository,
      super(FollowingDashboardListLoading());

  Stream<FollowingDashboardListState> _mapLoadFollowingDashboardListToState({ String orderBy, bool descending }) async* {
    _followingDashboardsListSubscription?.cancel();
    _followingDashboardsListSubscription = _followingDashboardRepository.listen((list) => add(FollowingDashboardListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<FollowingDashboardListState> _mapLoadFollowingDashboardListWithDetailsToState({ String orderBy, bool descending }) async* {
    _followingDashboardsListSubscription?.cancel();
    _followingDashboardsListSubscription = _followingDashboardRepository.listenWithDetails((list) => add(FollowingDashboardListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<FollowingDashboardListState> _mapAddFollowingDashboardListToState(AddFollowingDashboardList event) async* {
    _followingDashboardRepository.add(event.value);
  }

  Stream<FollowingDashboardListState> _mapUpdateFollowingDashboardListToState(UpdateFollowingDashboardList event) async* {
    _followingDashboardRepository.update(event.value);
  }

  Stream<FollowingDashboardListState> _mapDeleteFollowingDashboardListToState(DeleteFollowingDashboardList event) async* {
    _followingDashboardRepository.delete(event.value);
  }

  Stream<FollowingDashboardListState> _mapFollowingDashboardListUpdatedToState(FollowingDashboardListUpdated event) async* {
    yield FollowingDashboardListLoaded(values: event.value);
  }


  @override
  Stream<FollowingDashboardListState> mapEventToState(FollowingDashboardListEvent event) async* {
    final currentState = state;
    if (event is LoadFollowingDashboardList) {
      yield* _mapLoadFollowingDashboardListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadFollowingDashboardListWithDetails) {
      yield* _mapLoadFollowingDashboardListWithDetailsToState();
    } else if (event is AddFollowingDashboardList) {
      yield* _mapAddFollowingDashboardListToState(event);
    } else if (event is UpdateFollowingDashboardList) {
      yield* _mapUpdateFollowingDashboardListToState(event);
    } else if (event is DeleteFollowingDashboardList) {
      yield* _mapDeleteFollowingDashboardListToState(event);
    } else if (event is FollowingDashboardListUpdated) {
      yield* _mapFollowingDashboardListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _followingDashboardsListSubscription?.cancel();
    return super.close();
  }

}


