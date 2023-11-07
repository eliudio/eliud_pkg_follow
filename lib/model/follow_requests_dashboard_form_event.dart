/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_requests_dashboard_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';

@immutable
abstract class FollowRequestsDashboardFormEvent extends Equatable {
  const FollowRequestsDashboardFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewFollowRequestsDashboardFormEvent
    extends FollowRequestsDashboardFormEvent {}

class InitialiseFollowRequestsDashboardFormEvent
    extends FollowRequestsDashboardFormEvent {
  final FollowRequestsDashboardModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFollowRequestsDashboardFormEvent({this.value});
}

class InitialiseFollowRequestsDashboardFormNoLoadEvent
    extends FollowRequestsDashboardFormEvent {
  final FollowRequestsDashboardModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFollowRequestsDashboardFormNoLoadEvent({this.value});
}

class ChangedFollowRequestsDashboardDocumentID
    extends FollowRequestsDashboardFormEvent {
  final String? value;

  ChangedFollowRequestsDashboardDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedFollowRequestsDashboardDocumentID{ value: $value }';
}

class ChangedFollowRequestsDashboardAppId
    extends FollowRequestsDashboardFormEvent {
  final String? value;

  ChangedFollowRequestsDashboardAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowRequestsDashboardAppId{ value: $value }';
}

class ChangedFollowRequestsDashboardDescription
    extends FollowRequestsDashboardFormEvent {
  final String? value;

  ChangedFollowRequestsDashboardDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedFollowRequestsDashboardDescription{ value: $value }';
}

class ChangedFollowRequestsDashboardMemberActions
    extends FollowRequestsDashboardFormEvent {
  final List<MemberActionModel>? value;

  ChangedFollowRequestsDashboardMemberActions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedFollowRequestsDashboardMemberActions{ value: $value }';
}

class ChangedFollowRequestsDashboardConditions
    extends FollowRequestsDashboardFormEvent {
  final StorageConditionsModel? value;

  ChangedFollowRequestsDashboardConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedFollowRequestsDashboardConditions{ value: $value }';
}
