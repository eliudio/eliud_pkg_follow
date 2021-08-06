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

import 'package:eliud_pkg_follow/model/follow_requests_dashboard_form_event.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_form_state.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_repository.dart';

class FollowRequestsDashboardFormBloc extends Bloc<FollowRequestsDashboardFormEvent, FollowRequestsDashboardFormState> {
  final FormAction? formAction;
  final String? appId;

  FollowRequestsDashboardFormBloc(this.appId, { this.formAction }): super(FollowRequestsDashboardFormUninitialized());
  @override
  Stream<FollowRequestsDashboardFormState> mapEventToState(FollowRequestsDashboardFormEvent event) async* {
    final currentState = state;
    if (currentState is FollowRequestsDashboardFormUninitialized) {
      if (event is InitialiseNewFollowRequestsDashboardFormEvent) {
        FollowRequestsDashboardFormLoaded loaded = FollowRequestsDashboardFormLoaded(value: FollowRequestsDashboardModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 memberActions: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseFollowRequestsDashboardFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        FollowRequestsDashboardFormLoaded loaded = FollowRequestsDashboardFormLoaded(value: await followRequestsDashboardRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseFollowRequestsDashboardFormNoLoadEvent) {
        FollowRequestsDashboardFormLoaded loaded = FollowRequestsDashboardFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is FollowRequestsDashboardFormInitialized) {
      FollowRequestsDashboardModel? newValue = null;
      if (event is ChangedFollowRequestsDashboardDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableFollowRequestsDashboardForm(value: newValue);
        }

        return;
      }
      if (event is ChangedFollowRequestsDashboardAppId) {
        newValue = currentState.value!.copyWith(appId: event.value);
        yield SubmittableFollowRequestsDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedFollowRequestsDashboardDescription) {
        newValue = currentState.value!.copyWith(description: event.value);
        yield SubmittableFollowRequestsDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedFollowRequestsDashboardMemberActions) {
        newValue = currentState.value!.copyWith(memberActions: event.value);
        yield SubmittableFollowRequestsDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedFollowRequestsDashboardConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittableFollowRequestsDashboardForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDFollowRequestsDashboardFormError error(String message, FollowRequestsDashboardModel newValue) => DocumentIDFollowRequestsDashboardFormError(message: message, value: newValue);

  Future<FollowRequestsDashboardFormState> _isDocumentIDValid(String? value, FollowRequestsDashboardModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<FollowRequestsDashboardModel?> findDocument = followRequestsDashboardRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableFollowRequestsDashboardForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

