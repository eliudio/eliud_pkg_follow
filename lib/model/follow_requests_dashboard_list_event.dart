/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_requests_dashboard_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_model.dart';

abstract class FollowRequestsDashboardListEvent extends Equatable {
  const FollowRequestsDashboardListEvent();
  @override
  List<Object?> get props => [];
}

class LoadFollowRequestsDashboardList extends FollowRequestsDashboardListEvent {}

class NewPage extends FollowRequestsDashboardListEvent {}

class AddFollowRequestsDashboardList extends FollowRequestsDashboardListEvent {
  final FollowRequestsDashboardModel? value;

  const AddFollowRequestsDashboardList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddFollowRequestsDashboardList{ value: $value }';
}

class UpdateFollowRequestsDashboardList extends FollowRequestsDashboardListEvent {
  final FollowRequestsDashboardModel? value;

  const UpdateFollowRequestsDashboardList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateFollowRequestsDashboardList{ value: $value }';
}

class DeleteFollowRequestsDashboardList extends FollowRequestsDashboardListEvent {
  final FollowRequestsDashboardModel? value;

  const DeleteFollowRequestsDashboardList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteFollowRequestsDashboardList{ value: $value }';
}

class FollowRequestsDashboardListUpdated extends FollowRequestsDashboardListEvent {
  final List<FollowRequestsDashboardModel?>? value;
  final bool? mightHaveMore;

  const FollowRequestsDashboardListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'FollowRequestsDashboardListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class FollowRequestsDashboardChangeQuery extends FollowRequestsDashboardListEvent {
  final EliudQuery? newQuery;

  const FollowRequestsDashboardChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'FollowRequestsDashboardChangeQuery{ value: $newQuery }';
}

