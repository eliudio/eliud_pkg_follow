/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';


@immutable
abstract class FollowingDashboardFormEvent extends Equatable {
  const FollowingDashboardFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewFollowingDashboardFormEvent extends FollowingDashboardFormEvent {
}


class InitialiseFollowingDashboardFormEvent extends FollowingDashboardFormEvent {
  final FollowingDashboardModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseFollowingDashboardFormEvent({this.value});
}

class InitialiseFollowingDashboardFormNoLoadEvent extends FollowingDashboardFormEvent {
  final FollowingDashboardModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseFollowingDashboardFormNoLoadEvent({this.value});
}

class ChangedFollowingDashboardDocumentID extends FollowingDashboardFormEvent {
  final String value;

  ChangedFollowingDashboardDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFollowingDashboardDocumentID{ value: $value }';
}

class ChangedFollowingDashboardAppId extends FollowingDashboardFormEvent {
  final String value;

  ChangedFollowingDashboardAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFollowingDashboardAppId{ value: $value }';
}

class ChangedFollowingDashboardDescription extends FollowingDashboardFormEvent {
  final String value;

  ChangedFollowingDashboardDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFollowingDashboardDescription{ value: $value }';
}

class ChangedFollowingDashboardView extends FollowingDashboardFormEvent {
  final FollowingView value;

  ChangedFollowingDashboardView({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFollowingDashboardView{ value: $value }';
}

class ChangedFollowingDashboardConditions extends FollowingDashboardFormEvent {
  final ConditionsSimpleModel value;

  ChangedFollowingDashboardConditions({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFollowingDashboardConditions{ value: $value }';
}

