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

import 'package:eliud_pkg_follow/model/follow_requests_dashboard_repository.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_list_event.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_list_state.dart';
import 'package:eliud_core_model/tools/query/query_tools.dart';

import 'follow_requests_dashboard_model.dart';

typedef FilterFollowRequestsDashboardModels
    = List<FollowRequestsDashboardModel?> Function(
        List<FollowRequestsDashboardModel?> values);

class FollowRequestsDashboardListBloc extends Bloc<
    FollowRequestsDashboardListEvent, FollowRequestsDashboardListState> {
  final FilterFollowRequestsDashboardModels? filter;
  final FollowRequestsDashboardRepository _followRequestsDashboardRepository;
  StreamSubscription? _followRequestsDashboardsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int followRequestsDashboardLimit;

  FollowRequestsDashboardListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required FollowRequestsDashboardRepository
          followRequestsDashboardRepository,
      this.followRequestsDashboardLimit = 5})
      : _followRequestsDashboardRepository = followRequestsDashboardRepository,
        super(FollowRequestsDashboardListLoading()) {
    on<LoadFollowRequestsDashboardList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFollowRequestsDashboardListToState();
      } else {
        _mapLoadFollowRequestsDashboardListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadFollowRequestsDashboardListWithDetailsToState();
    });

    on<FollowRequestsDashboardChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFollowRequestsDashboardListToState();
      } else {
        _mapLoadFollowRequestsDashboardListWithDetailsToState();
      }
    });

    on<AddFollowRequestsDashboardList>((event, emit) async {
      await _mapAddFollowRequestsDashboardListToState(event);
    });

    on<UpdateFollowRequestsDashboardList>((event, emit) async {
      await _mapUpdateFollowRequestsDashboardListToState(event);
    });

    on<DeleteFollowRequestsDashboardList>((event, emit) async {
      await _mapDeleteFollowRequestsDashboardListToState(event);
    });

    on<FollowRequestsDashboardListUpdated>((event, emit) {
      emit(_mapFollowRequestsDashboardListUpdatedToState(event));
    });
  }

  List<FollowRequestsDashboardModel?> _filter(
      List<FollowRequestsDashboardModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadFollowRequestsDashboardListToState() async {
    int amountNow = (state is FollowRequestsDashboardListLoaded)
        ? (state as FollowRequestsDashboardListLoaded).values!.length
        : 0;
    _followRequestsDashboardsListSubscription?.cancel();
    _followRequestsDashboardsListSubscription =
        _followRequestsDashboardRepository.listen(
            (list) => add(FollowRequestsDashboardListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * followRequestsDashboardLimit
                : null);
  }

  Future<void> _mapLoadFollowRequestsDashboardListWithDetailsToState() async {
    int amountNow = (state is FollowRequestsDashboardListLoaded)
        ? (state as FollowRequestsDashboardListLoaded).values!.length
        : 0;
    _followRequestsDashboardsListSubscription?.cancel();
    _followRequestsDashboardsListSubscription =
        _followRequestsDashboardRepository.listenWithDetails(
            (list) => add(FollowRequestsDashboardListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * followRequestsDashboardLimit
                : null);
  }

  Future<void> _mapAddFollowRequestsDashboardListToState(
      AddFollowRequestsDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _followRequestsDashboardRepository.add(value);
    }
  }

  Future<void> _mapUpdateFollowRequestsDashboardListToState(
      UpdateFollowRequestsDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _followRequestsDashboardRepository.update(value);
    }
  }

  Future<void> _mapDeleteFollowRequestsDashboardListToState(
      DeleteFollowRequestsDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _followRequestsDashboardRepository.delete(value);
    }
  }

  FollowRequestsDashboardListLoaded
      _mapFollowRequestsDashboardListUpdatedToState(
              FollowRequestsDashboardListUpdated event) =>
          FollowRequestsDashboardListLoaded(
              values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _followRequestsDashboardsListSubscription?.cancel();
    return super.close();
  }
}
