/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_requests_dashboard_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';

import 'package:eliud_pkg_follow/model/follow_requests_dashboard_form_event.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_form_state.dart';

class FollowRequestsDashboardFormBloc extends Bloc<
    FollowRequestsDashboardFormEvent, FollowRequestsDashboardFormState> {
  final FormAction? formAction;
  final String? appId;

  FollowRequestsDashboardFormBloc(this.appId, {this.formAction})
      : super(FollowRequestsDashboardFormUninitialized()) {
    on<InitialiseNewFollowRequestsDashboardFormEvent>((event, emit) {
      FollowRequestsDashboardFormLoaded loaded =
          FollowRequestsDashboardFormLoaded(
              value: FollowRequestsDashboardModel(
        documentID: "",
        appId: "",
        description: "",
        memberActions: [],
      ));
      emit(loaded);
    });

    on<InitialiseFollowRequestsDashboardFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      FollowRequestsDashboardFormLoaded loaded =
          FollowRequestsDashboardFormLoaded(
              value: await followRequestsDashboardRepository(appId: appId)!
                  .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseFollowRequestsDashboardFormNoLoadEvent>((event, emit) async {
      FollowRequestsDashboardFormLoaded loaded =
          FollowRequestsDashboardFormLoaded(value: event.value);
      emit(loaded);
    });
    FollowRequestsDashboardModel? newValue;
    on<ChangedFollowRequestsDashboardDocumentID>((event, emit) async {
      if (state is FollowRequestsDashboardFormInitialized) {
        final currentState = state as FollowRequestsDashboardFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableFollowRequestsDashboardForm(value: newValue));
        }
      }
    });
    on<ChangedFollowRequestsDashboardAppId>((event, emit) async {
      if (state is FollowRequestsDashboardFormInitialized) {
        final currentState = state as FollowRequestsDashboardFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableFollowRequestsDashboardForm(value: newValue));
      }
    });
    on<ChangedFollowRequestsDashboardDescription>((event, emit) async {
      if (state is FollowRequestsDashboardFormInitialized) {
        final currentState = state as FollowRequestsDashboardFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableFollowRequestsDashboardForm(value: newValue));
      }
    });
    on<ChangedFollowRequestsDashboardMemberActions>((event, emit) async {
      if (state is FollowRequestsDashboardFormInitialized) {
        final currentState = state as FollowRequestsDashboardFormInitialized;
        newValue = currentState.value!.copyWith(memberActions: event.value);
        emit(SubmittableFollowRequestsDashboardForm(value: newValue));
      }
    });
    on<ChangedFollowRequestsDashboardConditions>((event, emit) async {
      if (state is FollowRequestsDashboardFormInitialized) {
        final currentState = state as FollowRequestsDashboardFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableFollowRequestsDashboardForm(value: newValue));
      }
    });
  }

  DocumentIDFollowRequestsDashboardFormError error(
          String message, FollowRequestsDashboardModel newValue) =>
      DocumentIDFollowRequestsDashboardFormError(
          message: message, value: newValue);

  Future<FollowRequestsDashboardFormState> _isDocumentIDValid(
      String? value, FollowRequestsDashboardModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<FollowRequestsDashboardModel?> findDocument =
        followRequestsDashboardRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableFollowRequestsDashboardForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
