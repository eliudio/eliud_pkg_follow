/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/follow_request_model.dart';

abstract class FollowRequestComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFollowRequestComponent extends FollowRequestComponentEvent {
  final String? id;

  FetchFollowRequestComponent({this.id});
}

class FollowRequestComponentUpdated extends FollowRequestComponentEvent {
  final FollowRequestModel value;

  FollowRequestComponentUpdated({required this.value});
}
