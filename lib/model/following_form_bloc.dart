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

  FollowingFormBloc(this.appId, { this.formAction }): super(FollowingFormUninitialized());
  @override
  Stream<FollowingFormState> mapEventToState(FollowingFormEvent event) async* {
    final currentState = state;
    if (currentState is FollowingFormUninitialized) {
      if (event is InitialiseNewFollowingFormEvent) {
        FollowingFormLoaded loaded = FollowingFormLoaded(value: FollowingModel(
                                               documentID: "",
                                 appId: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseFollowingFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        FollowingFormLoaded loaded = FollowingFormLoaded(value: await followingRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseFollowingFormNoLoadEvent) {
        FollowingFormLoaded loaded = FollowingFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is FollowingFormInitialized) {
      FollowingModel? newValue = null;
      if (event is ChangedFollowingDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableFollowingForm(value: newValue);
        }

        return;
      }
      if (event is ChangedFollowingFollower) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(follower: await memberPublicInfoRepository(appId: appId)!.get(event.value));
        else
          newValue = new FollowingModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 follower: null,
                                 followed: currentState.value!.followed,
          );
        yield SubmittableFollowingForm(value: newValue);

        return;
      }
      if (event is ChangedFollowingFollowed) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(followed: await memberPublicInfoRepository(appId: appId)!.get(event.value));
        else
          newValue = new FollowingModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 follower: currentState.value!.follower,
                                 followed: null,
          );
        yield SubmittableFollowingForm(value: newValue);

        return;
      }
    }
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

