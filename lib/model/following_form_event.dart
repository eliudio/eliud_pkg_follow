/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';

@immutable
abstract class FollowingFormEvent extends Equatable {
  const FollowingFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewFollowingFormEvent extends FollowingFormEvent {}

class InitialiseFollowingFormEvent extends FollowingFormEvent {
  final FollowingModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFollowingFormEvent({this.value});
}

class InitialiseFollowingFormNoLoadEvent extends FollowingFormEvent {
  final FollowingModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFollowingFormNoLoadEvent({this.value});
}

class ChangedFollowingDocumentID extends FollowingFormEvent {
  final String? value;

  ChangedFollowingDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowingDocumentID{ value: $value }';
}

class ChangedFollowingAppId extends FollowingFormEvent {
  final String? value;

  ChangedFollowingAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowingAppId{ value: $value }';
}

class ChangedFollowingFollower extends FollowingFormEvent {
  final String? value;

  ChangedFollowingFollower({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowingFollower{ value: $value }';
}

class ChangedFollowingFollowed extends FollowingFormEvent {
  final String? value;

  ChangedFollowingFollowed({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowingFollowed{ value: $value }';
}
