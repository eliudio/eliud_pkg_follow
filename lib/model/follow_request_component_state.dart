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

/* 
 * FollowRequestComponentState is the base class for state for FollowRequestComponentBloc
 */
abstract class FollowRequestComponentState extends Equatable {
  const FollowRequestComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * FollowRequestComponentUninitialized is the uninitialized state of the FollowRequestComponentBloc 
 */
class FollowRequestComponentUninitialized extends FollowRequestComponentState {}

/* 
 * FollowRequestComponentError is the error state of the FollowRequestComponentBloc 
 */
class FollowRequestComponentError extends FollowRequestComponentState {
  final String? message;
  FollowRequestComponentError({this.message});
}

/* 
 * FollowRequestComponentPermissionDenied is to indicate permission denied state of the FollowRequestComponentBloc 
 */
class FollowRequestComponentPermissionDenied
    extends FollowRequestComponentState {
  FollowRequestComponentPermissionDenied();
}

/* 
 * FollowRequestComponentLoaded is used to set the state of the FollowRequestComponentBloc to the loaded state
 */
class FollowRequestComponentLoaded extends FollowRequestComponentState {
  final FollowRequestModel value;

  /* 
   * construct FollowRequestComponentLoaded
   */
  const FollowRequestComponentLoaded({required this.value});

  /* 
   * copy method
   */
  FollowRequestComponentLoaded copyWith({FollowRequestModel? copyThis}) {
    return FollowRequestComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'FollowRequestComponentLoaded { value: $value }';
}
