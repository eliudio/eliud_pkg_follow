/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_form_bloc.dart
                       
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
import 'package:eliud_pkg_etc/model/repository_export.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_pkg_follow/model/following_dashboard_form_event.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_form_state.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_repository.dart';

class FollowingDashboardFormBloc extends Bloc<FollowingDashboardFormEvent, FollowingDashboardFormState> {
  final FormAction? formAction;
  final String? appId;

  FollowingDashboardFormBloc(this.appId, { this.formAction }): super(FollowingDashboardFormUninitialized());
  @override
  Stream<FollowingDashboardFormState> mapEventToState(FollowingDashboardFormEvent event) async* {
    final currentState = state;
    if (currentState is FollowingDashboardFormUninitialized) {
      if (event is InitialiseNewFollowingDashboardFormEvent) {
        FollowingDashboardFormLoaded loaded = FollowingDashboardFormLoaded(value: FollowingDashboardModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 memberActions: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseFollowingDashboardFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        FollowingDashboardFormLoaded loaded = FollowingDashboardFormLoaded(value: await followingDashboardRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseFollowingDashboardFormNoLoadEvent) {
        FollowingDashboardFormLoaded loaded = FollowingDashboardFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is FollowingDashboardFormInitialized) {
      FollowingDashboardModel? newValue = null;
      if (event is ChangedFollowingDashboardDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableFollowingDashboardForm(value: newValue);
        }

        return;
      }
      if (event is ChangedFollowingDashboardAppId) {
        newValue = currentState.value!.copyWith(appId: event.value);
        yield SubmittableFollowingDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedFollowingDashboardDescription) {
        newValue = currentState.value!.copyWith(description: event.value);
        yield SubmittableFollowingDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedFollowingDashboardView) {
        newValue = currentState.value!.copyWith(view: event.value);
        yield SubmittableFollowingDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedFollowingDashboardMemberActions) {
        newValue = currentState.value!.copyWith(memberActions: event.value);
        yield SubmittableFollowingDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedFollowingDashboardConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittableFollowingDashboardForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDFollowingDashboardFormError error(String message, FollowingDashboardModel newValue) => DocumentIDFollowingDashboardFormError(message: message, value: newValue);

  Future<FollowingDashboardFormState> _isDocumentIDValid(String? value, FollowingDashboardModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<FollowingDashboardModel?> findDocument = followingDashboardRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableFollowingDashboardForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

