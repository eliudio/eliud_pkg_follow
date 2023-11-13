/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_model.dart';

/*
 * InviteDashboardComponentEvent is the base class for events to be used with constructing a InviteDashboardComponentBloc 
 */
abstract class InviteDashboardComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchInviteDashboardComponent is the event to instruct the bloc to fetch the component
 */
class FetchInviteDashboardComponent extends InviteDashboardComponentEvent {
  final String? id;

  /*
   * Construct the FetchInviteDashboardComponent
   */
  FetchInviteDashboardComponent({this.id});
}

/*
 * InviteDashboardComponentUpdated is the event to inform the bloc that a component has been updated
 */
class InviteDashboardComponentUpdated extends InviteDashboardComponentEvent {
  final InviteDashboardModel value;

  /*
   * Construct the InviteDashboardComponentUpdated
   */
  InviteDashboardComponentUpdated({required this.value});
}
