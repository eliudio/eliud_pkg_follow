/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_pkg_follow/model/following_dashboard_entity.dart';

enum FollowingView { followers, following, unknown }

FollowingView toFollowingView(int? index) {
  switch (index) {
    case 0:
      return FollowingView.followers;
    case 1:
      return FollowingView.following;
  }
  return FollowingView.unknown;
}

class FollowingDashboardModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_follow';
  static const String id = 'followingDashboards';

  @override
  String documentID;

  // This is the identifier of the app to which this belongs
  @override
  String appId;
  String? description;
  FollowingView? view;

  // The extra actions that can be done on a member
  List<MemberActionModel>? memberActions;
  StorageConditionsModel? conditions;

  FollowingDashboardModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.view,
    this.memberActions,
    this.conditions,
  });

  @override
  FollowingDashboardModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    FollowingView? view,
    List<MemberActionModel>? memberActions,
    StorageConditionsModel? conditions,
  }) {
    return FollowingDashboardModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      view: view ?? this.view,
      memberActions: memberActions ?? this.memberActions,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      view.hashCode ^
      memberActions.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FollowingDashboardModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          view == other.view &&
          ListEquality().equals(memberActions, other.memberActions) &&
          conditions == other.conditions;

  @override
  String toString() {
    String memberActionsCsv =
        (memberActions == null) ? '' : memberActions!.join(', ');

    return 'FollowingDashboardModel{documentID: $documentID, appId: $appId, description: $description, view: $view, memberActions: MemberAction[] { $memberActionsCsv }, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (memberActions != null) {
      for (var item in memberActions!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  FollowingDashboardEntity toEntity({String? appId}) {
    return FollowingDashboardEntity(
      appId: appId,
      description: (description != null) ? description : null,
      view: (view != null) ? view!.index : null,
      memberActions: (memberActions != null)
          ? memberActions!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<FollowingDashboardModel?> fromEntity(
      String documentID, FollowingDashboardEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return FollowingDashboardModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      view: toFollowingView(entity.view),
      memberActions: entity.memberActions == null
          ? null
          : List<MemberActionModel>.from(
              await Future.wait(entity.memberActions!.map((item) {
              counter++;
              return MemberActionModel.fromEntity(counter.toString(), item);
            }).toList())),
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<FollowingDashboardModel?> fromEntityPlus(
      String documentID, FollowingDashboardEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return FollowingDashboardModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      view: toFollowingView(entity.view),
      memberActions: entity.memberActions == null
          ? null
          : List<MemberActionModel>.from(
              await Future.wait(entity.memberActions!.map((item) {
              counter++;
              return MemberActionModel.fromEntityPlus(counter.toString(), item,
                  appId: appId);
            }).toList())),
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
