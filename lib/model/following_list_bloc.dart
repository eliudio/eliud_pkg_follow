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
import 'package:eliud_core/tools/query/query_tools.dart';


const _followingLimit = 5;

class FollowingListBloc extends Bloc<FollowingListEvent, FollowingListState> {
  final FollowingRepository _followingRepository;
  StreamSubscription? _followingsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  FollowingListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required FollowingRepository followingRepository})
      : assert(followingRepository != null),
        _followingRepository = followingRepository,
        super(FollowingListLoading());

  Stream<FollowingListState> _mapLoadFollowingListToState() async* {
    int amountNow =  (state is FollowingListLoaded) ? (state as FollowingListLoaded).values!.length : 0;
    _followingsListSubscription?.cancel();
    _followingsListSubscription = _followingRepository.listen(
          (list) => add(FollowingListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _followingLimit : null
    );
  }

  Stream<FollowingListState> _mapLoadFollowingListWithDetailsToState() async* {
    int amountNow =  (state is FollowingListLoaded) ? (state as FollowingListLoaded).values!.length : 0;
    _followingsListSubscription?.cancel();
    _followingsListSubscription = _followingRepository.listenWithDetails(
            (list) => add(FollowingListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _followingLimit : null
    );
  }

  Stream<FollowingListState> _mapAddFollowingListToState(AddFollowingList event) async* {
    var value = event.value;
    if (value != null) 
      _followingRepository.add(value);
  }

  Stream<FollowingListState> _mapUpdateFollowingListToState(UpdateFollowingList event) async* {
    var value = event.value;
    if (value != null) 
      _followingRepository.update(value);
  }

  Stream<FollowingListState> _mapDeleteFollowingListToState(DeleteFollowingList event) async* {
    var value = event.value;
    if (value != null) 
      _followingRepository.delete(value);
  }

  Stream<FollowingListState> _mapFollowingListUpdatedToState(
      FollowingListUpdated event) async* {
    yield FollowingListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<FollowingListState> mapEventToState(FollowingListEvent event) async* {
    if (event is LoadFollowingList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadFollowingListToState();
      } else {
        yield* _mapLoadFollowingListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


