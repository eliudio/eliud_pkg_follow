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
import 'package:eliud_core/tools/query/query_tools.dart';



class FollowRequestListBloc extends Bloc<FollowRequestListEvent, FollowRequestListState> {
  final FollowRequestRepository _followRequestRepository;
  StreamSubscription? _followRequestsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int followRequestLimit;

  FollowRequestListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required FollowRequestRepository followRequestRepository, this.followRequestLimit = 5})
      : assert(followRequestRepository != null),
        _followRequestRepository = followRequestRepository,
        super(FollowRequestListLoading()) {
    on <LoadFollowRequestList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFollowRequestListToState();
      } else {
        _mapLoadFollowRequestListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadFollowRequestListWithDetailsToState();
    });
    
    on <FollowRequestChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFollowRequestListToState();
      } else {
        _mapLoadFollowRequestListWithDetailsToState();
      }
    });
      
    on <AddFollowRequestList> ((event, emit) async {
      await _mapAddFollowRequestListToState(event);
    });
    
    on <UpdateFollowRequestList> ((event, emit) async {
      await _mapUpdateFollowRequestListToState(event);
    });
    
    on <DeleteFollowRequestList> ((event, emit) async {
      await _mapDeleteFollowRequestListToState(event);
    });
    
    on <FollowRequestListUpdated> ((event, emit) {
      emit(_mapFollowRequestListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadFollowRequestListToState() async {
    int amountNow =  (state is FollowRequestListLoaded) ? (state as FollowRequestListLoaded).values!.length : 0;
    _followRequestsListSubscription?.cancel();
    _followRequestsListSubscription = _followRequestRepository.listen(
          (list) => add(FollowRequestListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * followRequestLimit : null
    );
  }

  Future<void> _mapLoadFollowRequestListWithDetailsToState() async {
    int amountNow =  (state is FollowRequestListLoaded) ? (state as FollowRequestListLoaded).values!.length : 0;
    _followRequestsListSubscription?.cancel();
    _followRequestsListSubscription = _followRequestRepository.listenWithDetails(
            (list) => add(FollowRequestListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * followRequestLimit : null
    );
  }

  Future<void> _mapAddFollowRequestListToState(AddFollowRequestList event) async {
    var value = event.value;
    if (value != null) {
      await _followRequestRepository.add(value);
    }
  }

  Future<void> _mapUpdateFollowRequestListToState(UpdateFollowRequestList event) async {
    var value = event.value;
    if (value != null) {
      await _followRequestRepository.update(value);
    }
  }

  Future<void> _mapDeleteFollowRequestListToState(DeleteFollowRequestList event) async {
    var value = event.value;
    if (value != null) {
      await _followRequestRepository.delete(value);
    }
  }

  FollowRequestListLoaded _mapFollowRequestListUpdatedToState(
      FollowRequestListUpdated event) => FollowRequestListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _followRequestsListSubscription?.cancel();
    return super.close();
  }
}


