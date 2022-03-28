/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/follow_request_model.dart';

abstract class FollowRequestListEvent extends Equatable {
  const FollowRequestListEvent();
  @override
  List<Object?> get props => [];
}

class LoadFollowRequestList extends FollowRequestListEvent {}

class NewPage extends FollowRequestListEvent {}

class AddFollowRequestList extends FollowRequestListEvent {
  final FollowRequestModel? value;

  const AddFollowRequestList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddFollowRequestList{ value: $value }';
}

class UpdateFollowRequestList extends FollowRequestListEvent {
  final FollowRequestModel? value;

  const UpdateFollowRequestList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateFollowRequestList{ value: $value }';
}

class DeleteFollowRequestList extends FollowRequestListEvent {
  final FollowRequestModel? value;

  const DeleteFollowRequestList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteFollowRequestList{ value: $value }';
}

class FollowRequestListUpdated extends FollowRequestListEvent {
  final List<FollowRequestModel?>? value;
  final bool? mightHaveMore;

  const FollowRequestListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'FollowRequestListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class FollowRequestChangeQuery extends FollowRequestListEvent {
  final EliudQuery newQuery;

  const FollowRequestChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'FollowRequestChangeQuery{ value: $newQuery }';
}

