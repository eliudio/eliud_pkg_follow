/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';

abstract class FollowingDashboardListEvent extends Equatable {
  const FollowingDashboardListEvent();
  @override
  List<Object> get props => [];
}

class LoadFollowingDashboardList extends FollowingDashboardListEvent {
  final String orderBy;
  final bool descending;

  LoadFollowingDashboardList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadFollowingDashboardListWithDetails extends FollowingDashboardListEvent {}

class AddFollowingDashboardList extends FollowingDashboardListEvent {
  final FollowingDashboardModel value;

  const AddFollowingDashboardList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddFollowingDashboardList{ value: $value }';
}

class UpdateFollowingDashboardList extends FollowingDashboardListEvent {
  final FollowingDashboardModel value;

  const UpdateFollowingDashboardList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateFollowingDashboardList{ value: $value }';
}

class DeleteFollowingDashboardList extends FollowingDashboardListEvent {
  final FollowingDashboardModel value;

  const DeleteFollowingDashboardList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteFollowingDashboardList{ value: $value }';
}

class FollowingDashboardListUpdated extends FollowingDashboardListEvent {
  final List<FollowingDashboardModel> value;

  const FollowingDashboardListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'FollowingDashboardListUpdated{ value: $value }';
}

