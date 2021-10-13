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

abstract class FollowingDashboardComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFollowingDashboardComponent extends FollowingDashboardComponentEvent {
  final String? id;

  FetchFollowingDashboardComponent({ this.id });
}

class FollowingDashboardComponentUpdated extends FollowingDashboardComponentEvent {
  final FollowingDashboardModel value;

  FollowingDashboardComponentUpdated({ required this.value });
}


