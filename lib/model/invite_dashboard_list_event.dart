/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_model.dart';

abstract class InviteDashboardListEvent extends Equatable {
  const InviteDashboardListEvent();
  @override
  List<Object> get props => [];
}

class LoadInviteDashboardList extends InviteDashboardListEvent {
  final String orderBy;
  final bool descending;

  LoadInviteDashboardList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadInviteDashboardListWithDetails extends InviteDashboardListEvent {}

class AddInviteDashboardList extends InviteDashboardListEvent {
  final InviteDashboardModel value;

  const AddInviteDashboardList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddInviteDashboardList{ value: $value }';
}

class UpdateInviteDashboardList extends InviteDashboardListEvent {
  final InviteDashboardModel value;

  const UpdateInviteDashboardList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateInviteDashboardList{ value: $value }';
}

class DeleteInviteDashboardList extends InviteDashboardListEvent {
  final InviteDashboardModel value;

  const DeleteInviteDashboardList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteInviteDashboardList{ value: $value }';
}

class InviteDashboardListUpdated extends InviteDashboardListEvent {
  final List<InviteDashboardModel> value;

  const InviteDashboardListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'InviteDashboardListUpdated{ value: $value }';
}

