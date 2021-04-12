/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/following_model.dart';

abstract class FollowingListEvent extends Equatable {
  const FollowingListEvent();
  @override
  List<Object?> get props => [];
}

class LoadFollowingList extends FollowingListEvent {}

class NewPage extends FollowingListEvent {}

class AddFollowingList extends FollowingListEvent {
  final FollowingModel? value;

  const AddFollowingList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddFollowingList{ value: $value }';
}

class UpdateFollowingList extends FollowingListEvent {
  final FollowingModel? value;

  const UpdateFollowingList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateFollowingList{ value: $value }';
}

class DeleteFollowingList extends FollowingListEvent {
  final FollowingModel? value;

  const DeleteFollowingList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteFollowingList{ value: $value }';
}

class FollowingListUpdated extends FollowingListEvent {
  final List<FollowingModel?>? value;
  final bool? mightHaveMore;

  const FollowingListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'FollowingListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

