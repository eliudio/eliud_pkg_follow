/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_requests_dashboard_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'follow_requests_dashboard_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FollowRequestsDashboardFormState extends Equatable {
  const FollowRequestsDashboardFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class FollowRequestsDashboardFormUninitialized
    extends FollowRequestsDashboardFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''FollowRequestsDashboardFormState()''';
  }
}

// FollowRequestsDashboardModel has been initialised and hence FollowRequestsDashboardModel is available
class FollowRequestsDashboardFormInitialized
    extends FollowRequestsDashboardFormState {
  final FollowRequestsDashboardModel? value;

  @override
  List<Object?> get props => [value];

  const FollowRequestsDashboardFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class FollowRequestsDashboardFormError
    extends FollowRequestsDashboardFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const FollowRequestsDashboardFormError({this.message, super.value});

  @override
  String toString() {
    return '''FollowRequestsDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDFollowRequestsDashboardFormError
    extends FollowRequestsDashboardFormError {
  const DocumentIDFollowRequestsDashboardFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDFollowRequestsDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdFollowRequestsDashboardFormError
    extends FollowRequestsDashboardFormError {
  const AppIdFollowRequestsDashboardFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdFollowRequestsDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionFollowRequestsDashboardFormError
    extends FollowRequestsDashboardFormError {
  const DescriptionFollowRequestsDashboardFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionFollowRequestsDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberActionsFollowRequestsDashboardFormError
    extends FollowRequestsDashboardFormError {
  const MemberActionsFollowRequestsDashboardFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MemberActionsFollowRequestsDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsFollowRequestsDashboardFormError
    extends FollowRequestsDashboardFormError {
  const ConditionsFollowRequestsDashboardFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsFollowRequestsDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class FollowRequestsDashboardFormLoaded
    extends FollowRequestsDashboardFormInitialized {
  const FollowRequestsDashboardFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''FollowRequestsDashboardFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableFollowRequestsDashboardForm
    extends FollowRequestsDashboardFormInitialized {
  const SubmittableFollowRequestsDashboardForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableFollowRequestsDashboardForm {
      value: $value,
    }''';
  }
}
