/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_requests_dashboard_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_model.dart';

/* 
 * FollowRequestsDashboardComponentState is the base class for state for FollowRequestsDashboardComponentBloc
 */
abstract class FollowRequestsDashboardComponentState extends Equatable {
  const FollowRequestsDashboardComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * FollowRequestsDashboardComponentUninitialized is the uninitialized state of the FollowRequestsDashboardComponentBloc 
 */
class FollowRequestsDashboardComponentUninitialized
    extends FollowRequestsDashboardComponentState {}

/* 
 * FollowRequestsDashboardComponentError is the error state of the FollowRequestsDashboardComponentBloc 
 */
class FollowRequestsDashboardComponentError
    extends FollowRequestsDashboardComponentState {
  final String? message;
  FollowRequestsDashboardComponentError({this.message});
}

/* 
 * FollowRequestsDashboardComponentPermissionDenied is to indicate permission denied state of the FollowRequestsDashboardComponentBloc 
 */
class FollowRequestsDashboardComponentPermissionDenied
    extends FollowRequestsDashboardComponentState {
  FollowRequestsDashboardComponentPermissionDenied();
}

/* 
 * FollowRequestsDashboardComponentLoaded is used to set the state of the FollowRequestsDashboardComponentBloc to the loaded state
 */
class FollowRequestsDashboardComponentLoaded
    extends FollowRequestsDashboardComponentState {
  final FollowRequestsDashboardModel value;

  /* 
   * construct FollowRequestsDashboardComponentLoaded
   */
  const FollowRequestsDashboardComponentLoaded({required this.value});

  /* 
   * copy method
   */
  FollowRequestsDashboardComponentLoaded copyWith(
      {FollowRequestsDashboardModel? copyThis}) {
    return FollowRequestsDashboardComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'FollowRequestsDashboardComponentLoaded { value: $value }';
}
