/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/follow_request_model.dart';

abstract class FollowRequestComponentState extends Equatable {
  const FollowRequestComponentState();

  @override
  List<Object?> get props => [];
}

class FollowRequestComponentUninitialized extends FollowRequestComponentState {}

class FollowRequestComponentError extends FollowRequestComponentState {
  final String? message;
  FollowRequestComponentError({ this.message });
}

class FollowRequestComponentPermissionDenied extends FollowRequestComponentState {
  FollowRequestComponentPermissionDenied();
}

class FollowRequestComponentLoaded extends FollowRequestComponentState {
  final FollowRequestModel? value;

  const FollowRequestComponentLoaded({ this.value });

  FollowRequestComponentLoaded copyWith({ FollowRequestModel? copyThis }) {
    return FollowRequestComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'FollowRequestComponentLoaded { value: $value }';
}

