/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'follow_request_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FollowRequestFormState extends Equatable {
  const FollowRequestFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class FollowRequestFormUninitialized extends FollowRequestFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''FollowRequestFormState()''';
  }
}

// FollowRequestModel has been initialised and hence FollowRequestModel is available
class FollowRequestFormInitialized extends FollowRequestFormState {
  final FollowRequestModel? value;

  @override
  List<Object?> get props => [value];

  const FollowRequestFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class FollowRequestFormError extends FollowRequestFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const FollowRequestFormError({this.message, super.value});

  @override
  String toString() {
    return '''FollowRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDFollowRequestFormError extends FollowRequestFormError {
  const DocumentIDFollowRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDFollowRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdFollowRequestFormError extends FollowRequestFormError {
  const AppIdFollowRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdFollowRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class FollowerFollowRequestFormError extends FollowRequestFormError {
  const FollowerFollowRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''FollowerFollowRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class FollowedFollowRequestFormError extends FollowRequestFormError {
  const FollowedFollowRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''FollowedFollowRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class StatusFollowRequestFormError extends FollowRequestFormError {
  const StatusFollowRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''StatusFollowRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class FollowRequestFormLoaded extends FollowRequestFormInitialized {
  const FollowRequestFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''FollowRequestFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableFollowRequestForm extends FollowRequestFormInitialized {
  const SubmittableFollowRequestForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableFollowRequestForm {
      value: $value,
    }''';
  }
}
