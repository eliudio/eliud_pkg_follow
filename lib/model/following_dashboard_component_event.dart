/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';

/*
 * FollowingDashboardComponentEvent is the base class for events to be used with constructing a FollowingDashboardComponentBloc 
 */
abstract class FollowingDashboardComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchFollowingDashboardComponent is the event to instruct the bloc to fetch the component
 */
class FetchFollowingDashboardComponent
    extends FollowingDashboardComponentEvent {
  final String? id;

  /*
   * Construct the FetchFollowingDashboardComponent
   */
  FetchFollowingDashboardComponent({this.id});
}

/*
 * FollowingDashboardComponentUpdated is the event to inform the bloc that a component has been updated
 */
class FollowingDashboardComponentUpdated
    extends FollowingDashboardComponentEvent {
  final FollowingDashboardModel value;

  /*
   * Construct the FollowingDashboardComponentUpdated
   */
  FollowingDashboardComponentUpdated({required this.value});
}
