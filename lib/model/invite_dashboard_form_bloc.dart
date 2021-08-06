/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_form_bloc.dart
                       
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

import 'package:eliud_pkg_follow/model/invite_dashboard_form_event.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_form_state.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_repository.dart';

class InviteDashboardFormBloc extends Bloc<InviteDashboardFormEvent, InviteDashboardFormState> {
  final FormAction? formAction;
  final String? appId;

  InviteDashboardFormBloc(this.appId, { this.formAction }): super(InviteDashboardFormUninitialized());
  @override
  Stream<InviteDashboardFormState> mapEventToState(InviteDashboardFormEvent event) async* {
    final currentState = state;
    if (currentState is InviteDashboardFormUninitialized) {
      if (event is InitialiseNewInviteDashboardFormEvent) {
        InviteDashboardFormLoaded loaded = InviteDashboardFormLoaded(value: InviteDashboardModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 memberActions: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseInviteDashboardFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        InviteDashboardFormLoaded loaded = InviteDashboardFormLoaded(value: await inviteDashboardRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseInviteDashboardFormNoLoadEvent) {
        InviteDashboardFormLoaded loaded = InviteDashboardFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is InviteDashboardFormInitialized) {
      InviteDashboardModel? newValue = null;
      if (event is ChangedInviteDashboardDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableInviteDashboardForm(value: newValue);
        }

        return;
      }
      if (event is ChangedInviteDashboardAppId) {
        newValue = currentState.value!.copyWith(appId: event.value);
        yield SubmittableInviteDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedInviteDashboardDescription) {
        newValue = currentState.value!.copyWith(description: event.value);
        yield SubmittableInviteDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedInviteDashboardMemberActions) {
        newValue = currentState.value!.copyWith(memberActions: event.value);
        yield SubmittableInviteDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedInviteDashboardConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittableInviteDashboardForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDInviteDashboardFormError error(String message, InviteDashboardModel newValue) => DocumentIDInviteDashboardFormError(message: message, value: newValue);

  Future<InviteDashboardFormState> _isDocumentIDValid(String? value, InviteDashboardModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<InviteDashboardModel?> findDocument = inviteDashboardRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableInviteDashboardForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

