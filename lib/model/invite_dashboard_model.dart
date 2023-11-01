/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';


import 'package:eliud_pkg_follow/model/invite_dashboard_entity.dart';




class InviteDashboardModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_follow';
  static const String id = 'inviteDashboards';

  String documentID;

  // This is the identifier of the app to which this belongs
  String appId;
  String? description;

  // The extra actions that can be done on a member
  List<MemberActionModel>? memberActions;
  StorageConditionsModel? conditions;

  InviteDashboardModel({required this.documentID, required this.appId, this.description, this.memberActions, this.conditions, });

  InviteDashboardModel copyWith({String? documentID, String? appId, String? description, List<MemberActionModel>? memberActions, StorageConditionsModel? conditions, }) {
    return InviteDashboardModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, memberActions: memberActions ?? this.memberActions, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ memberActions.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is InviteDashboardModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          ListEquality().equals(memberActions, other.memberActions) &&
          conditions == other.conditions;

  @override
  String toString() {
    String memberActionsCsv = (memberActions == null) ? '' : memberActions!.join(', ');

    return 'InviteDashboardModel{documentID: $documentID, appId: $appId, description: $description, memberActions: MemberAction[] { $memberActionsCsv }, conditions: $conditions}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (memberActions != null) {
      for (var item in memberActions!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (conditions != null) referencesCollector.addAll(await conditions!.collectReferences(appId: appId));
    return referencesCollector;
  }

  InviteDashboardEntity toEntity({String? appId}) {
    return InviteDashboardEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          memberActions: (memberActions != null) ? memberActions
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<InviteDashboardModel?> fromEntity(String documentID, InviteDashboardEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return InviteDashboardModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          memberActions: 
            entity.memberActions == null ? null : List<MemberActionModel>.from(await Future.wait(entity. memberActions
            !.map((item) {
            counter++;
              return MemberActionModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<InviteDashboardModel?> fromEntityPlus(String documentID, InviteDashboardEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return InviteDashboardModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          memberActions: 
            entity. memberActions == null ? null : List<MemberActionModel>.from(await Future.wait(entity. memberActions
            !.map((item) {
            counter++;
            return MemberActionModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

