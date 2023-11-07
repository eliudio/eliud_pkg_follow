/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'following_dashboard_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FollowingDashboardFormState extends Equatable {
  const FollowingDashboardFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class FollowingDashboardFormUninitialized extends FollowingDashboardFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''FollowingDashboardFormState()''';
  }
}

// FollowingDashboardModel has been initialised and hence FollowingDashboardModel is available
class FollowingDashboardFormInitialized extends FollowingDashboardFormState {
  final FollowingDashboardModel? value;

  @override
  List<Object?> get props => [value];

  const FollowingDashboardFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class FollowingDashboardFormError
    extends FollowingDashboardFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const FollowingDashboardFormError({this.message, super.value});

  @override
  String toString() {
    return '''FollowingDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDFollowingDashboardFormError
    extends FollowingDashboardFormError {
  const DocumentIDFollowingDashboardFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDFollowingDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdFollowingDashboardFormError extends FollowingDashboardFormError {
  const AppIdFollowingDashboardFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdFollowingDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionFollowingDashboardFormError
    extends FollowingDashboardFormError {
  const DescriptionFollowingDashboardFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionFollowingDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ViewFollowingDashboardFormError extends FollowingDashboardFormError {
  const ViewFollowingDashboardFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ViewFollowingDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberActionsFollowingDashboardFormError
    extends FollowingDashboardFormError {
  const MemberActionsFollowingDashboardFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MemberActionsFollowingDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsFollowingDashboardFormError
    extends FollowingDashboardFormError {
  const ConditionsFollowingDashboardFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsFollowingDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class FollowingDashboardFormLoaded extends FollowingDashboardFormInitialized {
  const FollowingDashboardFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''FollowingDashboardFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableFollowingDashboardForm
    extends FollowingDashboardFormInitialized {
  const SubmittableFollowingDashboardForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableFollowingDashboardForm {
      value: $value,
    }''';
  }
}
