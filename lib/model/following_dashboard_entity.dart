/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class FollowingDashboardEntity implements EntityBase {
  final String? appId;
  final String? description;
  final int? view;
  final List<MemberActionEntity>? memberActions;
  final StorageConditionsEntity? conditions;

  FollowingDashboardEntity({required this.appId, this.description, this.view, this.memberActions, this.conditions, });


  List<Object?> get props => [appId, description, view, memberActions, conditions, ];

  @override
  String toString() {
    String memberActionsCsv = (memberActions == null) ? '' : memberActions!.join(', ');

    return 'FollowingDashboardEntity{appId: $appId, description: $description, view: $view, memberActions: MemberAction[] { $memberActionsCsv }, conditions: $conditions}';
  }

  static FollowingDashboardEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var memberActionsFromMap;
    memberActionsFromMap = map['memberActions'];
    var memberActionsList;
    if (memberActionsFromMap != null)
      memberActionsList = (map['memberActions'] as List<dynamic>)
        .map((dynamic item) =>
        MemberActionEntity.fromMap(item as Map)!)
        .toList();
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap);

    return FollowingDashboardEntity(
      appId: map['appId'], 
      description: map['description'], 
      view: map['view'], 
      memberActions: memberActionsList, 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? memberActionsListMap = memberActions != null 
        ? memberActions!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (view != null) theDocument["view"] = view;
      else theDocument["view"] = null;
    if (memberActions != null) theDocument["memberActions"] = memberActionsListMap;
      else theDocument["memberActions"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static FollowingDashboardEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

