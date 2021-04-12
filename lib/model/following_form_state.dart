/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'following_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FollowingFormState extends Equatable {
  const FollowingFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class FollowingFormUninitialized extends FollowingFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''FollowingFormState()''';
  }
}

// FollowingModel has been initialised and hence FollowingModel is available
class FollowingFormInitialized extends FollowingFormState {
  final FollowingModel? value;

  @override
  List<Object?> get props => [ value ];

  const FollowingFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class FollowingFormError extends FollowingFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const FollowingFormError({this.message, FollowingModel? value }) : super(value: value);

  @override
  String toString() {
    return '''FollowingFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDFollowingFormError extends FollowingFormError { 
  const DocumentIDFollowingFormError({ String? message, FollowingModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDFollowingFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdFollowingFormError extends FollowingFormError { 
  const AppIdFollowingFormError({ String? message, FollowingModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdFollowingFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FollowerFollowingFormError extends FollowingFormError { 
  const FollowerFollowingFormError({ String? message, FollowingModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FollowerFollowingFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FollowedFollowingFormError extends FollowingFormError { 
  const FollowedFollowingFormError({ String? message, FollowingModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FollowedFollowingFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FollowingFormLoaded extends FollowingFormInitialized { 
  const FollowingFormLoaded({ FollowingModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''FollowingFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableFollowingForm extends FollowingFormInitialized { 
  const SubmittableFollowingForm({ FollowingModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableFollowingForm {
      value: $value,
    }''';
  }
}


