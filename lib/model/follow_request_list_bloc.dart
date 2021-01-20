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


const _followRequestLimit = 5;

class FollowRequestListBloc extends Bloc<FollowRequestListEvent, FollowRequestListState> {
  final FollowRequestRepository _followRequestRepository;
  StreamSubscription _followRequestsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  FollowRequestListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required FollowRequestRepository followRequestRepository})
      : assert(followRequestRepository != null),
        _followRequestRepository = followRequestRepository,
        super(FollowRequestListLoading());

  Stream<FollowRequestListState> _mapLoadFollowRequestListToState() async* {
    int amountNow =  (state is FollowRequestListLoaded) ? (state as FollowRequestListLoaded).values.length : 0;
    _followRequestsListSubscription?.cancel();
    _followRequestsListSubscription = _followRequestRepository.listen(
          (list) => add(FollowRequestListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _followRequestLimit : null
    );
  }

  Stream<FollowRequestListState> _mapLoadFollowRequestListWithDetailsToState() async* {
    int amountNow =  (state is FollowRequestListLoaded) ? (state as FollowRequestListLoaded).values.length : 0;
    _followRequestsListSubscription?.cancel();
    _followRequestsListSubscription = _followRequestRepository.listenWithDetails(
            (list) => add(FollowRequestListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _followRequestLimit : null
    );
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

  Stream<FollowRequestListState> _mapFollowRequestListUpdatedToState(
      FollowRequestListUpdated event) async* {
    yield FollowRequestListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<FollowRequestListState> mapEventToState(FollowRequestListEvent event) async* {
    if (event is LoadFollowRequestList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadFollowRequestListToState();
      } else {
        yield* _mapLoadFollowRequestListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


