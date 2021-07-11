/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/repository_export.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';


@immutable
abstract class InviteDashboardFormEvent extends Equatable {
  const InviteDashboardFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewInviteDashboardFormEvent extends InviteDashboardFormEvent {
}


class InitialiseInviteDashboardFormEvent extends InviteDashboardFormEvent {
  final InviteDashboardModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseInviteDashboardFormEvent({this.value});
}

class InitialiseInviteDashboardFormNoLoadEvent extends InviteDashboardFormEvent {
  final InviteDashboardModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseInviteDashboardFormNoLoadEvent({this.value});
}

class ChangedInviteDashboardDocumentID extends InviteDashboardFormEvent {
  final String? value;

  ChangedInviteDashboardDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedInviteDashboardDocumentID{ value: $value }';
}

class ChangedInviteDashboardAppId extends InviteDashboardFormEvent {
  final String? value;

  ChangedInviteDashboardAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedInviteDashboardAppId{ value: $value }';
}

class ChangedInviteDashboardDescription extends InviteDashboardFormEvent {
  final String? value;

  ChangedInviteDashboardDescription({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedInviteDashboardDescription{ value: $value }';
}

class ChangedInviteDashboardMemberActions extends InviteDashboardFormEvent {
  final List<MemberActionModel>? value;

  ChangedInviteDashboardMemberActions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedInviteDashboardMemberActions{ value: $value }';
}

class ChangedInviteDashboardConditions extends InviteDashboardFormEvent {
  final ConditionsSimpleModel? value;

  ChangedInviteDashboardConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedInviteDashboardConditions{ value: $value }';
}

