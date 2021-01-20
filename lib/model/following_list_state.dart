/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/following_model.dart';

abstract class FollowingListState extends Equatable {
  const FollowingListState();

  @override
  List<Object> get props => [];
}

class FollowingListLoading extends FollowingListState {}

class FollowingListLoaded extends FollowingListState {
  final List<FollowingModel> values;
  final bool mightHaveMore;

  const FollowingListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'FollowingListLoaded { values: $values }';
}

class FollowingNotLoaded extends FollowingListState {}

