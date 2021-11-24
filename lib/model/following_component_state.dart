/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/following_model.dart';

abstract class FollowingComponentState extends Equatable {
  const FollowingComponentState();

  @override
  List<Object?> get props => [];
}

class FollowingComponentUninitialized extends FollowingComponentState {}

class FollowingComponentError extends FollowingComponentState {
  final String? message;
  FollowingComponentError({ this.message });
}

class FollowingComponentPermissionDenied extends FollowingComponentState {
  FollowingComponentPermissionDenied();
}

class FollowingComponentLoaded extends FollowingComponentState {
  final FollowingModel value;

  const FollowingComponentLoaded({ required this.value });

  FollowingComponentLoaded copyWith({ FollowingModel? copyThis }) {
    return FollowingComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'FollowingComponentLoaded { value: $value }';
}

