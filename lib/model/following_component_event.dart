/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/following_model.dart';

abstract class FollowingComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFollowingComponent extends FollowingComponentEvent {
  final String? id;

  FetchFollowingComponent({this.id});
}

class FollowingComponentUpdated extends FollowingComponentEvent {
  final FollowingModel value;

  FollowingComponentUpdated({required this.value});
}
