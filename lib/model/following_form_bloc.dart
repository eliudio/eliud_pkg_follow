/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_pkg_follow/model/following_form_event.dart';
import 'package:eliud_pkg_follow/model/following_form_state.dart';
import 'package:eliud_pkg_follow/model/following_repository.dart';

class FollowingFormBloc extends Bloc<FollowingFormEvent, FollowingFormState> {
  final FormAction? formAction;
  final String? appId;

  FollowingFormBloc(this.appId, { this.formAction }): super(FollowingFormUninitialized()) {
      on <InitialiseNewFollowingFormEvent> ((event, emit) {
        FollowingFormLoaded loaded = FollowingFormLoaded(value: FollowingModel(
                                               documentID: "",
                                 appId: "",

        ));
        emit(loaded);
      });


      on <InitialiseFollowingFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        FollowingFormLoaded loaded = FollowingFormLoaded(value: await followingRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseFollowingFormNoLoadEvent> ((event, emit) async {
        FollowingFormLoaded loaded = FollowingFormLoaded(value: event.value);
        emit(loaded);
      });
      FollowingModel? newValue = null;
      on <ChangedFollowingDocumentID> ((event, emit) async {
      if (state is FollowingFormInitialized) {
        final currentState = state as FollowingFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableFollowingForm(value: newValue));
        }

      }
      });
      on <ChangedFollowingFollower> ((event, emit) async {
      if (state is FollowingFormInitialized) {
        final currentState = state as FollowingFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(follower: await memberPublicInfoRepository(appId: appId)!.get(event.value));
        emit(SubmittableFollowingForm(value: newValue));

      }
      });
      on <ChangedFollowingFollowed> ((event, emit) async {
      if (state is FollowingFormInitialized) {
        final currentState = state as FollowingFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(followed: await memberPublicInfoRepository(appId: appId)!.get(event.value));
        emit(SubmittableFollowingForm(value: newValue));

      }
      });
  }


  DocumentIDFollowingFormError error(String message, FollowingModel newValue) => DocumentIDFollowingFormError(message: message, value: newValue);

  Future<FollowingFormState> _isDocumentIDValid(String? value, FollowingModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<FollowingModel?> findDocument = followingRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableFollowingForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

