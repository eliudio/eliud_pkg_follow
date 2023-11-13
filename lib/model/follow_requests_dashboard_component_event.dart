/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_requests_dashboard_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_model.dart';

/*
 * FollowRequestsDashboardComponentEvent is the base class for events to be used with constructing a FollowRequestsDashboardComponentBloc 
 */
abstract class FollowRequestsDashboardComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchFollowRequestsDashboardComponent is the event to instruct the bloc to fetch the component
 */
class FetchFollowRequestsDashboardComponent
    extends FollowRequestsDashboardComponentEvent {
  final String? id;

  /*
   * Construct the FetchFollowRequestsDashboardComponent
   */
  FetchFollowRequestsDashboardComponent({this.id});
}

/*
 * FollowRequestsDashboardComponentUpdated is the event to inform the bloc that a component has been updated
 */
class FollowRequestsDashboardComponentUpdated
    extends FollowRequestsDashboardComponentEvent {
  final FollowRequestsDashboardModel value;

  /*
   * Construct the FollowRequestsDashboardComponentUpdated
   */
  FollowRequestsDashboardComponentUpdated({required this.value});
}
