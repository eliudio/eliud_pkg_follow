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

import 'package:eliud_pkg_follow/model/following_repository.dart';
import 'package:eliud_pkg_follow/model/following_list_event.dart';
import 'package:eliud_pkg_follow/model/following_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'following_model.dart';

typedef FilterFollowingModels = List<FollowingModel?> Function(
    List<FollowingModel?> values);

class FollowingListBloc extends Bloc<FollowingListEvent, FollowingListState> {
  final FilterFollowingModels? filter;
  final FollowingRepository _followingRepository;
  StreamSubscription? _followingsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int followingLimit;

  FollowingListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required FollowingRepository followingRepository,
      this.followingLimit = 5})
      : _followingRepository = followingRepository,
        super(FollowingListLoading()) {
    on<LoadFollowingList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFollowingListToState();
      } else {
        _mapLoadFollowingListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadFollowingListWithDetailsToState();
    });

    on<FollowingChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFollowingListToState();
      } else {
        _mapLoadFollowingListWithDetailsToState();
      }
    });

    on<AddFollowingList>((event, emit) async {
      await _mapAddFollowingListToState(event);
    });

    on<UpdateFollowingList>((event, emit) async {
      await _mapUpdateFollowingListToState(event);
    });

    on<DeleteFollowingList>((event, emit) async {
      await _mapDeleteFollowingListToState(event);
    });

    on<FollowingListUpdated>((event, emit) {
      emit(_mapFollowingListUpdatedToState(event));
    });
  }

  List<FollowingModel?> _filter(List<FollowingModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadFollowingListToState() async {
    int amountNow = (state is FollowingListLoaded)
        ? (state as FollowingListLoaded).values!.length
        : 0;
    _followingsListSubscription?.cancel();
    _followingsListSubscription = _followingRepository.listen(
        (list) => add(FollowingListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * followingLimit : null);
  }

  Future<void> _mapLoadFollowingListWithDetailsToState() async {
    int amountNow = (state is FollowingListLoaded)
        ? (state as FollowingListLoaded).values!.length
        : 0;
    _followingsListSubscription?.cancel();
    _followingsListSubscription = _followingRepository.listenWithDetails(
        (list) => add(FollowingListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * followingLimit : null);
  }

  Future<void> _mapAddFollowingListToState(AddFollowingList event) async {
    var value = event.value;
    if (value != null) {
      await _followingRepository.add(value);
    }
  }

  Future<void> _mapUpdateFollowingListToState(UpdateFollowingList event) async {
    var value = event.value;
    if (value != null) {
      await _followingRepository.update(value);
    }
  }

  Future<void> _mapDeleteFollowingListToState(DeleteFollowingList event) async {
    var value = event.value;
    if (value != null) {
      await _followingRepository.delete(value);
    }
  }

  FollowingListLoaded _mapFollowingListUpdatedToState(
          FollowingListUpdated event) =>
      FollowingListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _followingsListSubscription?.cancel();
    return super.close();
  }
}
