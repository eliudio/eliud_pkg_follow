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

/* 
 * FollowingComponentState is the base class for state for FollowingComponentBloc
 */
abstract class FollowingComponentState extends Equatable {
  const FollowingComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * FollowingComponentUninitialized is the uninitialized state of the FollowingComponentBloc 
 */
class FollowingComponentUninitialized extends FollowingComponentState {}

/* 
 * FollowingComponentError is the error state of the FollowingComponentBloc 
 */
class FollowingComponentError extends FollowingComponentState {
  final String? message;
  FollowingComponentError({this.message});
}

/* 
 * FollowingComponentPermissionDenied is to indicate permission denied state of the FollowingComponentBloc 
 */
class FollowingComponentPermissionDenied extends FollowingComponentState {
  FollowingComponentPermissionDenied();
}

/* 
 * FollowingComponentLoaded is used to set the state of the FollowingComponentBloc to the loaded state
 */
class FollowingComponentLoaded extends FollowingComponentState {
  final FollowingModel value;

  /* 
   * construct FollowingComponentLoaded
   */
  const FollowingComponentLoaded({required this.value});

  /* 
   * copy method
   */
  FollowingComponentLoaded copyWith({FollowingModel? copyThis}) {
    return FollowingComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'FollowingComponentLoaded { value: $value }';
}
