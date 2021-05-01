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

import 'package:eliud_pkg_follow/model/follow_request_form_event.dart';
import 'package:eliud_pkg_follow/model/follow_request_form_state.dart';
import 'package:eliud_pkg_follow/model/follow_request_repository.dart';

class FollowRequestFormBloc extends Bloc<FollowRequestFormEvent, FollowRequestFormState> {
  final FormAction? formAction;
  final String? appId;

  FollowRequestFormBloc(this.appId, { this.formAction }): super(FollowRequestFormUninitialized());
  @override
  Stream<FollowRequestFormState> mapEventToState(FollowRequestFormEvent event) async* {
    final currentState = state;
    if (currentState is FollowRequestFormUninitialized) {
      if (event is InitialiseNewFollowRequestFormEvent) {
        FollowRequestFormLoaded loaded = FollowRequestFormLoaded(value: FollowRequestModel(
                                               documentID: "",
                                 appId: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseFollowRequestFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        FollowRequestFormLoaded loaded = FollowRequestFormLoaded(value: await followRequestRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseFollowRequestFormNoLoadEvent) {
        FollowRequestFormLoaded loaded = FollowRequestFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is FollowRequestFormInitialized) {
      FollowRequestModel? newValue = null;
      if (event is ChangedFollowRequestDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableFollowRequestForm(value: newValue);
        }

        return;
      }
      if (event is ChangedFollowRequestFollower) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(follower: await memberPublicInfoRepository(appId: appId)!.get(event.value));
        else
          newValue = new FollowRequestModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 follower: null,
                                 followed: currentState.value!.followed,
                                 status: currentState.value!.status,
          );
        yield SubmittableFollowRequestForm(value: newValue);

        return;
      }
      if (event is ChangedFollowRequestFollowed) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(followed: await memberPublicInfoRepository(appId: appId)!.get(event.value));
        else
          newValue = new FollowRequestModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 follower: currentState.value!.follower,
                                 followed: null,
                                 status: currentState.value!.status,
          );
        yield SubmittableFollowRequestForm(value: newValue);

        return;
      }
      if (event is ChangedFollowRequestStatus) {
        newValue = currentState.value!.copyWith(status: event.value);
        yield SubmittableFollowRequestForm(value: newValue);

        return;
      }
    }
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

