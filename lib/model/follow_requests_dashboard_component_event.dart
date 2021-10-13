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

abstract class FollowRequestsDashboardComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFollowRequestsDashboardComponent extends FollowRequestsDashboardComponentEvent {
  final String? id;

  FetchFollowRequestsDashboardComponent({ this.id });
}

class FollowRequestsDashboardComponentUpdated extends FollowRequestsDashboardComponentEvent {
  final FollowRequestsDashboardModel value;

  FollowRequestsDashboardComponentUpdated({ required this.value });
}


