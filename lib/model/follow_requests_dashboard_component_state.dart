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

abstract class FollowRequestsDashboardComponentState extends Equatable {
  const FollowRequestsDashboardComponentState();

  @override
  List<Object?> get props => [];
}

class FollowRequestsDashboardComponentUninitialized
    extends FollowRequestsDashboardComponentState {}

class FollowRequestsDashboardComponentError
    extends FollowRequestsDashboardComponentState {
  final String? message;
  FollowRequestsDashboardComponentError({this.message});
}

class FollowRequestsDashboardComponentPermissionDenied
    extends FollowRequestsDashboardComponentState {
  FollowRequestsDashboardComponentPermissionDenied();
}

class FollowRequestsDashboardComponentLoaded
    extends FollowRequestsDashboardComponentState {
  final FollowRequestsDashboardModel value;

  const FollowRequestsDashboardComponentLoaded({required this.value});

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
