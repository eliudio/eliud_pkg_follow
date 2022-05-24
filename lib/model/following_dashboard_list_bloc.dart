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
        super(FollowingDashboardListLoading()) {
    on <LoadFollowingDashboardList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFollowingDashboardListToState();
      } else {
        _mapLoadFollowingDashboardListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadFollowingDashboardListWithDetailsToState();
    });
    
    on <FollowingDashboardChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFollowingDashboardListToState();
      } else {
        _mapLoadFollowingDashboardListWithDetailsToState();
      }
    });
      
    on <AddFollowingDashboardList> ((event, emit) async {
      await _mapAddFollowingDashboardListToState(event);
    });
    
    on <UpdateFollowingDashboardList> ((event, emit) async {
      await _mapUpdateFollowingDashboardListToState(event);
    });
    
    on <DeleteFollowingDashboardList> ((event, emit) async {
      await _mapDeleteFollowingDashboardListToState(event);
    });
    
    on <FollowingDashboardListUpdated> ((event, emit) {
      emit(_mapFollowingDashboardListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadFollowingDashboardListToState() async {
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

  Future<void> _mapLoadFollowingDashboardListWithDetailsToState() async {
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

  Future<void> _mapAddFollowingDashboardListToState(AddFollowingDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _followingDashboardRepository.add(value);
    }
  }

  Future<void> _mapUpdateFollowingDashboardListToState(UpdateFollowingDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _followingDashboardRepository.update(value);
    }
  }

  Future<void> _mapDeleteFollowingDashboardListToState(DeleteFollowingDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _followingDashboardRepository.delete(value);
    }
  }

  FollowingDashboardListLoaded _mapFollowingDashboardListUpdatedToState(
      FollowingDashboardListUpdated event) => FollowingDashboardListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _followingDashboardsListSubscription?.cancel();
    return super.close();
  }
}


