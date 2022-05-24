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
        super(InviteDashboardListLoading()) {
    on <LoadInviteDashboardList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadInviteDashboardListToState();
      } else {
        _mapLoadInviteDashboardListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadInviteDashboardListWithDetailsToState();
    });
    
    on <InviteDashboardChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadInviteDashboardListToState();
      } else {
        _mapLoadInviteDashboardListWithDetailsToState();
      }
    });
      
    on <AddInviteDashboardList> ((event, emit) async {
      await _mapAddInviteDashboardListToState(event);
    });
    
    on <UpdateInviteDashboardList> ((event, emit) async {
      await _mapUpdateInviteDashboardListToState(event);
    });
    
    on <DeleteInviteDashboardList> ((event, emit) async {
      await _mapDeleteInviteDashboardListToState(event);
    });
    
    on <InviteDashboardListUpdated> ((event, emit) {
      emit(_mapInviteDashboardListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadInviteDashboardListToState() async {
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

  Future<void> _mapLoadInviteDashboardListWithDetailsToState() async {
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

  Future<void> _mapAddInviteDashboardListToState(AddInviteDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _inviteDashboardRepository.add(value);
    }
  }

  Future<void> _mapUpdateInviteDashboardListToState(UpdateInviteDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _inviteDashboardRepository.update(value);
    }
  }

  Future<void> _mapDeleteInviteDashboardListToState(DeleteInviteDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _inviteDashboardRepository.delete(value);
    }
  }

  InviteDashboardListLoaded _mapInviteDashboardListUpdatedToState(
      InviteDashboardListUpdated event) => InviteDashboardListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _inviteDashboardsListSubscription?.cancel();
    return super.close();
  }
}


