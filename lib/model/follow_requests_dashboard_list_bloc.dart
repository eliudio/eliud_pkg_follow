/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_requests_dashboard_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_follow/model/follow_requests_dashboard_repository.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_list_event.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class FollowRequestsDashboardListBloc extends Bloc<FollowRequestsDashboardListEvent, FollowRequestsDashboardListState> {
  final FollowRequestsDashboardRepository _followRequestsDashboardRepository;
  StreamSubscription _followRequestsDashboardsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  FollowRequestsDashboardListBloc(this.accessBloc,{ this.eliudQuery, @required FollowRequestsDashboardRepository followRequestsDashboardRepository })
      : assert(followRequestsDashboardRepository != null),
      _followRequestsDashboardRepository = followRequestsDashboardRepository,
      super(FollowRequestsDashboardListLoading());

  Stream<FollowRequestsDashboardListState> _mapLoadFollowRequestsDashboardListToState({ String orderBy, bool descending }) async* {
    _followRequestsDashboardsListSubscription?.cancel();
    _followRequestsDashboardsListSubscription = _followRequestsDashboardRepository.listen((list) => add(FollowRequestsDashboardListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<FollowRequestsDashboardListState> _mapLoadFollowRequestsDashboardListWithDetailsToState({ String orderBy, bool descending }) async* {
    _followRequestsDashboardsListSubscription?.cancel();
    _followRequestsDashboardsListSubscription = _followRequestsDashboardRepository.listenWithDetails((list) => add(FollowRequestsDashboardListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<FollowRequestsDashboardListState> _mapAddFollowRequestsDashboardListToState(AddFollowRequestsDashboardList event) async* {
    _followRequestsDashboardRepository.add(event.value);
  }

  Stream<FollowRequestsDashboardListState> _mapUpdateFollowRequestsDashboardListToState(UpdateFollowRequestsDashboardList event) async* {
    _followRequestsDashboardRepository.update(event.value);
  }

  Stream<FollowRequestsDashboardListState> _mapDeleteFollowRequestsDashboardListToState(DeleteFollowRequestsDashboardList event) async* {
    _followRequestsDashboardRepository.delete(event.value);
  }

  Stream<FollowRequestsDashboardListState> _mapFollowRequestsDashboardListUpdatedToState(FollowRequestsDashboardListUpdated event) async* {
    yield FollowRequestsDashboardListLoaded(values: event.value);
  }


  @override
  Stream<FollowRequestsDashboardListState> mapEventToState(FollowRequestsDashboardListEvent event) async* {
    final currentState = state;
    if (event is LoadFollowRequestsDashboardList) {
      yield* _mapLoadFollowRequestsDashboardListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadFollowRequestsDashboardListWithDetails) {
      yield* _mapLoadFollowRequestsDashboardListWithDetailsToState();
    } else if (event is AddFollowRequestsDashboardList) {
      yield* _mapAddFollowRequestsDashboardListToState(event);
    } else if (event is UpdateFollowRequestsDashboardList) {
      yield* _mapUpdateFollowRequestsDashboardListToState(event);
    } else if (event is DeleteFollowRequestsDashboardList) {
      yield* _mapDeleteFollowRequestsDashboardListToState(event);
    } else if (event is FollowRequestsDashboardListUpdated) {
      yield* _mapFollowRequestsDashboardListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _followRequestsDashboardsListSubscription?.cancel();
    return super.close();
  }

}


