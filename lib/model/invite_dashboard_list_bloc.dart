/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_follow/model/invite_dashboard_repository.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_list_event.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class InviteDashboardListBloc extends Bloc<InviteDashboardListEvent, InviteDashboardListState> {
  final InviteDashboardRepository _inviteDashboardRepository;
  StreamSubscription? _inviteDashboardsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int inviteDashboardLimit;

  InviteDashboardListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required InviteDashboardRepository inviteDashboardRepository, this.inviteDashboardLimit = 5})
      : assert(inviteDashboardRepository != null),
        _inviteDashboardRepository = inviteDashboardRepository,
        super(InviteDashboardListLoading());

  Stream<InviteDashboardListState> _mapLoadInviteDashboardListToState() async* {
    int amountNow =  (state is InviteDashboardListLoaded) ? (state as InviteDashboardListLoaded).values!.length : 0;
    _inviteDashboardsListSubscription?.cancel();
    _inviteDashboardsListSubscription = _inviteDashboardRepository.listen(
          (list) => add(InviteDashboardListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * inviteDashboardLimit : null
    );
  }

  Stream<InviteDashboardListState> _mapLoadInviteDashboardListWithDetailsToState() async* {
    int amountNow =  (state is InviteDashboardListLoaded) ? (state as InviteDashboardListLoaded).values!.length : 0;
    _inviteDashboardsListSubscription?.cancel();
    _inviteDashboardsListSubscription = _inviteDashboardRepository.listenWithDetails(
            (list) => add(InviteDashboardListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * inviteDashboardLimit : null
    );
  }

  Stream<InviteDashboardListState> _mapAddInviteDashboardListToState(AddInviteDashboardList event) async* {
    var value = event.value;
    if (value != null) 
      _inviteDashboardRepository.add(value);
  }

  Stream<InviteDashboardListState> _mapUpdateInviteDashboardListToState(UpdateInviteDashboardList event) async* {
    var value = event.value;
    if (value != null) 
      _inviteDashboardRepository.update(value);
  }

  Stream<InviteDashboardListState> _mapDeleteInviteDashboardListToState(DeleteInviteDashboardList event) async* {
    var value = event.value;
    if (value != null) 
      _inviteDashboardRepository.delete(value);
  }

  Stream<InviteDashboardListState> _mapInviteDashboardListUpdatedToState(
      InviteDashboardListUpdated event) async* {
    yield InviteDashboardListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<InviteDashboardListState> mapEventToState(InviteDashboardListEvent event) async* {
    if (event is LoadInviteDashboardList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadInviteDashboardListToState();
      } else {
        yield* _mapLoadInviteDashboardListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadInviteDashboardListWithDetailsToState();
    } else if (event is InviteDashboardChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadInviteDashboardListToState();
      } else {
        yield* _mapLoadInviteDashboardListWithDetailsToState();
      }
    } else if (event is AddInviteDashboardList) {
      yield* _mapAddInviteDashboardListToState(event);
    } else if (event is UpdateInviteDashboardList) {
      yield* _mapUpdateInviteDashboardListToState(event);
    } else if (event is DeleteInviteDashboardList) {
      yield* _mapDeleteInviteDashboardListToState(event);
    } else if (event is InviteDashboardListUpdated) {
      yield* _mapInviteDashboardListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _inviteDashboardsListSubscription?.cancel();
    return super.close();
  }
}


