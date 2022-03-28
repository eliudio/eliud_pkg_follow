/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';

abstract class FollowingDashboardListState extends Equatable {
  const FollowingDashboardListState();

  @override
  List<Object?> get props => [];
}

class FollowingDashboardListLoading extends FollowingDashboardListState {}

class FollowingDashboardListLoaded extends FollowingDashboardListState {
  final List<FollowingDashboardModel?>? values;
  final bool? mightHaveMore;

  const FollowingDashboardListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'FollowingDashboardListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is FollowingDashboardListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class FollowingDashboardNotLoaded extends FollowingDashboardListState {}

