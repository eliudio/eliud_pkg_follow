/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'invite_dashboard_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class InviteDashboardFormState extends Equatable {
  const InviteDashboardFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class InviteDashboardFormUninitialized extends InviteDashboardFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''InviteDashboardFormState()''';
  }
}

// InviteDashboardModel has been initialised and hence InviteDashboardModel is available
class InviteDashboardFormInitialized extends InviteDashboardFormState {
  final InviteDashboardModel value;

  @override
  List<Object> get props => [ value ];

  const InviteDashboardFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class InviteDashboardFormError extends InviteDashboardFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const InviteDashboardFormError({this.message, InviteDashboardModel value }) : super(value: value);

  @override
  String toString() {
    return '''InviteDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDInviteDashboardFormError extends InviteDashboardFormError { 
  const DocumentIDInviteDashboardFormError({ String message, InviteDashboardModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDInviteDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdInviteDashboardFormError extends InviteDashboardFormError { 
  const AppIdInviteDashboardFormError({ String message, InviteDashboardModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdInviteDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionInviteDashboardFormError extends InviteDashboardFormError { 
  const DescriptionInviteDashboardFormError({ String message, InviteDashboardModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionInviteDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsInviteDashboardFormError extends InviteDashboardFormError { 
  const ConditionsInviteDashboardFormError({ String message, InviteDashboardModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsInviteDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class InviteDashboardFormLoaded extends InviteDashboardFormInitialized { 
  const InviteDashboardFormLoaded({ InviteDashboardModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''InviteDashboardFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableInviteDashboardForm extends InviteDashboardFormInitialized { 
  const SubmittableInviteDashboardForm({ InviteDashboardModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableInviteDashboardForm {
      value: $value,
    }''';
  }
}


