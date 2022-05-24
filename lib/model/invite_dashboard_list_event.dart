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

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_model.dart';

abstract class InviteDashboardListEvent extends Equatable {
  const InviteDashboardListEvent();
  @override
  List<Object?> get props => [];
}

class LoadInviteDashboardList extends InviteDashboardListEvent {}

class NewPage extends InviteDashboardListEvent {}

class AddInviteDashboardList extends InviteDashboardListEvent {
  final InviteDashboardModel? value;

  const AddInviteDashboardList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddInviteDashboardList{ value: $value }';
}

class UpdateInviteDashboardList extends InviteDashboardListEvent {
  final InviteDashboardModel? value;

  const UpdateInviteDashboardList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateInviteDashboardList{ value: $value }';
}

class DeleteInviteDashboardList extends InviteDashboardListEvent {
  final InviteDashboardModel? value;

  const DeleteInviteDashboardList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteInviteDashboardList{ value: $value }';
}

class InviteDashboardListUpdated extends InviteDashboardListEvent {
  final List<InviteDashboardModel?>? value;
  final bool? mightHaveMore;

  const InviteDashboardListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'InviteDashboardListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class InviteDashboardChangeQuery extends InviteDashboardListEvent {
  final EliudQuery? newQuery;

  const InviteDashboardChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'InviteDashboardChangeQuery{ value: $newQuery }';
}

