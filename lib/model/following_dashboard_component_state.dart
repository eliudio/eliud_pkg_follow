/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';

/* 
 * FollowingDashboardComponentState is the base class for state for FollowingDashboardComponentBloc
 */
abstract class FollowingDashboardComponentState extends Equatable {
  const FollowingDashboardComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * FollowingDashboardComponentUninitialized is the uninitialized state of the FollowingDashboardComponentBloc 
 */
class FollowingDashboardComponentUninitialized
    extends FollowingDashboardComponentState {}

/* 
 * FollowingDashboardComponentError is the error state of the FollowingDashboardComponentBloc 
 */
class FollowingDashboardComponentError
    extends FollowingDashboardComponentState {
  final String? message;
  FollowingDashboardComponentError({this.message});
}

/* 
 * FollowingDashboardComponentPermissionDenied is to indicate permission denied state of the FollowingDashboardComponentBloc 
 */
class FollowingDashboardComponentPermissionDenied
    extends FollowingDashboardComponentState {
  FollowingDashboardComponentPermissionDenied();
}

/* 
 * FollowingDashboardComponentLoaded is used to set the state of the FollowingDashboardComponentBloc to the loaded state
 */
class FollowingDashboardComponentLoaded
    extends FollowingDashboardComponentState {
  final FollowingDashboardModel value;

  /* 
   * construct FollowingDashboardComponentLoaded
   */
  const FollowingDashboardComponentLoaded({required this.value});

  /* 
   * copy method
   */
  FollowingDashboardComponentLoaded copyWith(
      {FollowingDashboardModel? copyThis}) {
    return FollowingDashboardComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'FollowingDashboardComponentLoaded { value: $value }';
}
