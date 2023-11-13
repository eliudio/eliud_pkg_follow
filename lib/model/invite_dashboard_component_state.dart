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

/* 
 * InviteDashboardComponentState is the base class for state for InviteDashboardComponentBloc
 */
abstract class InviteDashboardComponentState extends Equatable {
  const InviteDashboardComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * InviteDashboardComponentUninitialized is the uninitialized state of the InviteDashboardComponentBloc 
 */
class InviteDashboardComponentUninitialized
    extends InviteDashboardComponentState {}

/* 
 * InviteDashboardComponentError is the error state of the InviteDashboardComponentBloc 
 */
class InviteDashboardComponentError extends InviteDashboardComponentState {
  final String? message;
  InviteDashboardComponentError({this.message});
}

/* 
 * InviteDashboardComponentPermissionDenied is to indicate permission denied state of the InviteDashboardComponentBloc 
 */
class InviteDashboardComponentPermissionDenied
    extends InviteDashboardComponentState {
  InviteDashboardComponentPermissionDenied();
}

/* 
 * InviteDashboardComponentLoaded is used to set the state of the InviteDashboardComponentBloc to the loaded state
 */
class InviteDashboardComponentLoaded extends InviteDashboardComponentState {
  final InviteDashboardModel value;

  /* 
   * construct InviteDashboardComponentLoaded
   */
  const InviteDashboardComponentLoaded({required this.value});

  /* 
   * copy method
   */
  InviteDashboardComponentLoaded copyWith({InviteDashboardModel? copyThis}) {
    return InviteDashboardComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'InviteDashboardComponentLoaded { value: $value }';
}
