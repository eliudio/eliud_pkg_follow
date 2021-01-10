/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_model.dart';

abstract class InviteDashboardComponentState extends Equatable {
  const InviteDashboardComponentState();

  @override
  List<Object> get props => [];
}

class InviteDashboardComponentUninitialized extends InviteDashboardComponentState {}

class InviteDashboardComponentError extends InviteDashboardComponentState {
  final String message;
  InviteDashboardComponentError({ this.message });
}

class InviteDashboardComponentPermissionDenied extends InviteDashboardComponentState {
  InviteDashboardComponentPermissionDenied();
}

class InviteDashboardComponentLoaded extends InviteDashboardComponentState {
  final InviteDashboardModel value;

  const InviteDashboardComponentLoaded({ this.value });

  InviteDashboardComponentLoaded copyWith({ InviteDashboardModel copyThis }) {
    return InviteDashboardComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'InviteDashboardComponentLoaded { value: $value }';
}

