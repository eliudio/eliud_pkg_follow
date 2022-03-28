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
import 'package:eliud_core/tools/query/query_tools.dart';



class FollowingDashboardListBloc extends Bloc<FollowingDashboardListEvent, FollowingDashboardListState> {
  final FollowingDashboardRepository _followingDashboardRepository;
  StreamSubscription? _followingDashboardsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int followingDashboardLimit;

  FollowingDashboardListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required FollowingDashboardRepository followingDashboardRepository, this.followingDashboardLimit = 5})
      : assert(followingDashboardRepository != null),
        _followingDashboardRepository = followingDashboardRepository,
        super(FollowingDashboardListLoading());

  Stream<FollowingDashboardListState> _mapLoadFollowingDashboardListToState() async* {
    int amountNow =  (state is FollowingDashboardListLoaded) ? (state as FollowingDashboardListLoaded).values!.length : 0;
    _followingDashboardsListSubscription?.cancel();
    _followingDashboardsListSubscription = _followingDashboardRepository.listen(
          (list) => add(FollowingDashboardListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * followingDashboardLimit : null
    );
  }

  Stream<FollowingDashboardListState> _mapLoadFollowingDashboardListWithDetailsToState() async* {
    int amountNow =  (state is FollowingDashboardListLoaded) ? (state as FollowingDashboardListLoaded).values!.length : 0;
    _followingDashboardsListSubscription?.cancel();
    _followingDashboardsListSubscription = _followingDashboardRepository.listenWithDetails(
            (list) => add(FollowingDashboardListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * followingDashboardLimit : null
    );
  }

  Stream<FollowingDashboardListState> _mapAddFollowingDashboardListToState(AddFollowingDashboardList event) async* {
    var value = event.value;
    if (value != null) 
      _followingDashboardRepository.add(value);
  }

  Stream<FollowingDashboardListState> _mapUpdateFollowingDashboardListToState(UpdateFollowingDashboardList event) async* {
    var value = event.value;
    if (value != null) 
      _followingDashboardRepository.update(value);
  }

  Stream<FollowingDashboardListState> _mapDeleteFollowingDashboardListToState(DeleteFollowingDashboardList event) async* {
    var value = event.value;
    if (value != null) 
      _followingDashboardRepository.delete(value);
  }

  Stream<FollowingDashboardListState> _mapFollowingDashboardListUpdatedToState(
      FollowingDashboardListUpdated event) async* {
    yield FollowingDashboardListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<FollowingDashboardListState> mapEventToState(FollowingDashboardListEvent event) async* {
    if (event is LoadFollowingDashboardList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadFollowingDashboardListToState();
      } else {
        yield* _mapLoadFollowingDashboardListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadFollowingDashboardListWithDetailsToState();
    } else if (event is FollowingDashboardChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadFollowingDashboardListToState();
      } else {
        yield* _mapLoadFollowingDashboardListWithDetailsToState();
      }
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


