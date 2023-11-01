/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core/tools/enums.dart';



import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';

import 'package:eliud_pkg_follow/model/follow_request_form_event.dart';
import 'package:eliud_pkg_follow/model/follow_request_form_state.dart';

class FollowRequestFormBloc extends Bloc<FollowRequestFormEvent, FollowRequestFormState> {
  final FormAction? formAction;
  final String? appId;

  FollowRequestFormBloc(this.appId, { this.formAction }): super(FollowRequestFormUninitialized()) {
      on <InitialiseNewFollowRequestFormEvent> ((event, emit) {
        FollowRequestFormLoaded loaded = FollowRequestFormLoaded(value: FollowRequestModel(
                                               documentID: "",
                                 appId: "",

        ));
        emit(loaded);
      });


      on <InitialiseFollowRequestFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        FollowRequestFormLoaded loaded = FollowRequestFormLoaded(value: await followRequestRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseFollowRequestFormNoLoadEvent> ((event, emit) async {
        FollowRequestFormLoaded loaded = FollowRequestFormLoaded(value: event.value);
        emit(loaded);
      });
      FollowRequestModel? newValue;
      on <ChangedFollowRequestDocumentID> ((event, emit) async {
      if (state is FollowRequestFormInitialized) {
        final currentState = state as FollowRequestFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableFollowRequestForm(value: newValue));
        }

      }
      });
      on <ChangedFollowRequestFollower> ((event, emit) async {
      if (state is FollowRequestFormInitialized) {
        final currentState = state as FollowRequestFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(follower: await memberPublicInfoRepository(appId: appId)!.get(event.value));
        emit(SubmittableFollowRequestForm(value: newValue));

      }
      });
      on <ChangedFollowRequestFollowed> ((event, emit) async {
      if (state is FollowRequestFormInitialized) {
        final currentState = state as FollowRequestFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(followed: await memberPublicInfoRepository(appId: appId)!.get(event.value));
        emit(SubmittableFollowRequestForm(value: newValue));

      }
      });
      on <ChangedFollowRequestStatus> ((event, emit) async {
      if (state is FollowRequestFormInitialized) {
        final currentState = state as FollowRequestFormInitialized;
        newValue = currentState.value!.copyWith(status: event.value);
        emit(SubmittableFollowRequestForm(value: newValue));

      }
      });
  }


  DocumentIDFollowRequestFormError error(String message, FollowRequestModel newValue) => DocumentIDFollowRequestFormError(message: message, value: newValue);

  Future<FollowRequestFormState> _isDocumentIDValid(String? value, FollowRequestModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<FollowRequestModel?> findDocument = followRequestRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableFollowRequestForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

