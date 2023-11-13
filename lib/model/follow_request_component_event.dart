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

/*
 * FollowRequestComponentEvent is the base class for events to be used with constructing a FollowRequestComponentBloc 
 */
abstract class FollowRequestComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchFollowRequestComponent is the event to instruct the bloc to fetch the component
 */
class FetchFollowRequestComponent extends FollowRequestComponentEvent {
  final String? id;

  /*
   * Construct the FetchFollowRequestComponent
   */
  FetchFollowRequestComponent({this.id});
}

/*
 * FollowRequestComponentUpdated is the event to inform the bloc that a component has been updated
 */
class FollowRequestComponentUpdated extends FollowRequestComponentEvent {
  final FollowRequestModel value;

  /*
   * Construct the FollowRequestComponentUpdated
   */
  FollowRequestComponentUpdated({required this.value});
}
