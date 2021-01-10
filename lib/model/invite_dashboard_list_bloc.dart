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
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class InviteDashboardListBloc extends Bloc<InviteDashboardListEvent, InviteDashboardListState> {
  final InviteDashboardRepository _inviteDashboardRepository;
  StreamSubscription _inviteDashboardsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  InviteDashboardListBloc(this.accessBloc,{ this.eliudQuery, @required InviteDashboardRepository inviteDashboardRepository })
      : assert(inviteDashboardRepository != null),
      _inviteDashboardRepository = inviteDashboardRepository,
      super(InviteDashboardListLoading());

  Stream<InviteDashboardListState> _mapLoadInviteDashboardListToState({ String orderBy, bool descending }) async* {
    _inviteDashboardsListSubscription?.cancel();
    _inviteDashboardsListSubscription = _inviteDashboardRepository.listen((list) => add(InviteDashboardListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<InviteDashboardListState> _mapLoadInviteDashboardListWithDetailsToState() async* {
    _inviteDashboardsListSubscription?.cancel();
    _inviteDashboardsListSubscription = _inviteDashboardRepository.listenWithDetails((list) => add(InviteDashboardListUpdated(value: list)), );
  }

  Stream<InviteDashboardListState> _mapAddInviteDashboardListToState(AddInviteDashboardList event) async* {
    _inviteDashboardRepository.add(event.value);
  }

  Stream<InviteDashboardListState> _mapUpdateInviteDashboardListToState(UpdateInviteDashboardList event) async* {
    _inviteDashboardRepository.update(event.value);
  }

  Stream<InviteDashboardListState> _mapDeleteInviteDashboardListToState(DeleteInviteDashboardList event) async* {
    _inviteDashboardRepository.delete(event.value);
  }

  Stream<InviteDashboardListState> _mapInviteDashboardListUpdatedToState(InviteDashboardListUpdated event) async* {
    yield InviteDashboardListLoaded(values: event.value);
  }


  @override
  Stream<InviteDashboardListState> mapEventToState(InviteDashboardListEvent event) async* {
    final currentState = state;
    if (event is LoadInviteDashboardList) {
      yield* _mapLoadInviteDashboardListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadInviteDashboardListWithDetails) {
      yield* _mapLoadInviteDashboardListWithDetailsToState();
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


