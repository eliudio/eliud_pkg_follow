/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/follow_request_model.dart';

abstract class FollowRequestListState extends Equatable {
  const FollowRequestListState();

  @override
  List<Object> get props => [];
}

class FollowRequestListLoading extends FollowRequestListState {}

class FollowRequestListLoaded extends FollowRequestListState {
  final List<FollowRequestModel> values;

  const FollowRequestListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'FollowRequestListLoaded { values: $values }';
}

class FollowRequestNotLoaded extends FollowRequestListState {}

