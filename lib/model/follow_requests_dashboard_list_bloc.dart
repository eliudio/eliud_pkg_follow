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
import 'package:eliud_core/tools/query/query_tools.dart';


const _followRequestsDashboardLimit = 5;

class FollowRequestsDashboardListBloc extends Bloc<FollowRequestsDashboardListEvent, FollowRequestsDashboardListState> {
  final FollowRequestsDashboardRepository _followRequestsDashboardRepository;
  StreamSubscription? _followRequestsDashboardsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  FollowRequestsDashboardListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required FollowRequestsDashboardRepository followRequestsDashboardRepository})
      : assert(followRequestsDashboardRepository != null),
        _followRequestsDashboardRepository = followRequestsDashboardRepository,
        super(FollowRequestsDashboardListLoading());

  Stream<FollowRequestsDashboardListState> _mapLoadFollowRequestsDashboardListToState() async* {
    int amountNow =  (state is FollowRequestsDashboardListLoaded) ? (state as FollowRequestsDashboardListLoaded).values!.length : 0;
    _followRequestsDashboardsListSubscription?.cancel();
    _followRequestsDashboardsListSubscription = _followRequestsDashboardRepository.listen(
          (list) => add(FollowRequestsDashboardListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _followRequestsDashboardLimit : null
    );
  }

  Stream<FollowRequestsDashboardListState> _mapLoadFollowRequestsDashboardListWithDetailsToState() async* {
    int amountNow =  (state is FollowRequestsDashboardListLoaded) ? (state as FollowRequestsDashboardListLoaded).values!.length : 0;
    _followRequestsDashboardsListSubscription?.cancel();
    _followRequestsDashboardsListSubscription = _followRequestsDashboardRepository.listenWithDetails(
            (list) => add(FollowRequestsDashboardListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _followRequestsDashboardLimit : null
    );
  }

  Stream<FollowRequestsDashboardListState> _mapAddFollowRequestsDashboardListToState(AddFollowRequestsDashboardList event) async* {
    var value = event.value;
    if (value != null) 
      _followRequestsDashboardRepository.add(value);
  }

  Stream<FollowRequestsDashboardListState> _mapUpdateFollowRequestsDashboardListToState(UpdateFollowRequestsDashboardList event) async* {
    var value = event.value;
    if (value != null) 
      _followRequestsDashboardRepository.update(value);
  }

  Stream<FollowRequestsDashboardListState> _mapDeleteFollowRequestsDashboardListToState(DeleteFollowRequestsDashboardList event) async* {
    var value = event.value;
    if (value != null) 
      _followRequestsDashboardRepository.delete(value);
  }

  Stream<FollowRequestsDashboardListState> _mapFollowRequestsDashboardListUpdatedToState(
      FollowRequestsDashboardListUpdated event) async* {
    yield FollowRequestsDashboardListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<FollowRequestsDashboardListState> mapEventToState(FollowRequestsDashboardListEvent event) async* {
    if (event is LoadFollowRequestsDashboardList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadFollowRequestsDashboardListToState();
      } else {
        yield* _mapLoadFollowRequestsDashboardListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


