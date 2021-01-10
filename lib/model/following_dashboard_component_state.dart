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

abstract class FollowingDashboardComponentState extends Equatable {
  const FollowingDashboardComponentState();

  @override
  List<Object> get props => [];
}

class FollowingDashboardComponentUninitialized extends FollowingDashboardComponentState {}

class FollowingDashboardComponentError extends FollowingDashboardComponentState {
  final String message;
  FollowingDashboardComponentError({ this.message });
}

class FollowingDashboardComponentPermissionDenied extends FollowingDashboardComponentState {
  FollowingDashboardComponentPermissionDenied();
}

class FollowingDashboardComponentLoaded extends FollowingDashboardComponentState {
  final FollowingDashboardModel value;

  const FollowingDashboardComponentLoaded({ this.value });

  FollowingDashboardComponentLoaded copyWith({ FollowingDashboardModel copyThis }) {
    return FollowingDashboardComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'FollowingDashboardComponentLoaded { value: $value }';
}

