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

/*
 * FollowingComponentEvent is the base class for events to be used with constructing a FollowingComponentBloc 
 */
abstract class FollowingComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchFollowingComponent is the event to instruct the bloc to fetch the component
 */
class FetchFollowingComponent extends FollowingComponentEvent {
  final String? id;

  /*
   * Construct the FetchFollowingComponent
   */
  FetchFollowingComponent({this.id});
}

/*
 * FollowingComponentUpdated is the event to inform the bloc that a component has been updated
 */
class FollowingComponentUpdated extends FollowingComponentEvent {
  final FollowingModel value;

  /*
   * Construct the FollowingComponentUpdated
   */
  FollowingComponentUpdated({required this.value});
}
