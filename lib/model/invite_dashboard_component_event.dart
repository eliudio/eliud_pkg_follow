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

abstract class InviteDashboardComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchInviteDashboardComponent extends InviteDashboardComponentEvent {
  final String? id;

  FetchInviteDashboardComponent({ this.id });
}

class InviteDashboardComponentUpdated extends InviteDashboardComponentEvent {
  final InviteDashboardModel value;

  InviteDashboardComponentUpdated({ required this.value });
}


