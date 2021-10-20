/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_follow/model/invite_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_component_event.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_component_state.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_repository.dart';
import 'package:flutter/services.dart';

class InviteDashboardComponentBloc extends Bloc<InviteDashboardComponentEvent, InviteDashboardComponentState> {
  final InviteDashboardRepository? inviteDashboardRepository;
  StreamSubscription? _inviteDashboardSubscription;

  Stream<InviteDashboardComponentState> _mapLoadInviteDashboardComponentUpdateToState(String documentId) async* {
    _inviteDashboardSubscription?.cancel();
    _inviteDashboardSubscription = inviteDashboardRepository!.listenTo(documentId, (value) {
      if (value != null) add(InviteDashboardComponentUpdated(value: value));
    });
  }

  InviteDashboardComponentBloc({ this.inviteDashboardRepository }): super(InviteDashboardComponentUninitialized());

  @override
  Stream<InviteDashboardComponentState> mapEventToState(InviteDashboardComponentEvent event) async* {
    final currentState = state;
    if (event is FetchInviteDashboardComponent) {
      yield* _mapLoadInviteDashboardComponentUpdateToState(event.id!);
    } else if (event is InviteDashboardComponentUpdated) {
      yield InviteDashboardComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _inviteDashboardSubscription?.cancel();
    return super.close();
  }

}

