/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_model.dart';

abstract class InviteDashboardListState extends Equatable {
  const InviteDashboardListState();

  @override
  List<Object?> get props => [];
}

class InviteDashboardListLoading extends InviteDashboardListState {}

class InviteDashboardListLoaded extends InviteDashboardListState {
  final List<InviteDashboardModel?>? values;
  final bool? mightHaveMore;

  const InviteDashboardListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'InviteDashboardListLoaded { values: $values }';
}

class InviteDashboardNotLoaded extends InviteDashboardListState {}

