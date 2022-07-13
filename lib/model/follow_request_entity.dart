/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class FollowRequestEntity implements EntityBase {
  final String? appId;
  final String? followerId;
  final String? followedId;
  final int? status;

  FollowRequestEntity({required this.appId, this.followerId, this.followedId, this.status, });

  FollowRequestEntity copyWith({String? documentID, String? appId, String? followerId, String? followedId, int? status, }) {
    return FollowRequestEntity(appId : appId ?? this.appId, followerId : followerId ?? this.followerId, followedId : followedId ?? this.followedId, status : status ?? this.status, );
  }
  List<Object?> get props => [appId, followerId, followedId, status, ];

  @override
  String toString() {
    return 'FollowRequestEntity{appId: $appId, followerId: $followerId, followedId: $followedId, status: $status}';
  }

  static FollowRequestEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return FollowRequestEntity(
      appId: map['appId'], 
      followerId: map['followerId'], 
      followedId: map['followedId'], 
      status: map['status'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (followerId != null) theDocument["followerId"] = followerId;
      else theDocument["followerId"] = null;
    if (followedId != null) theDocument["followedId"] = followedId;
      else theDocument["followedId"] = null;
    if (status != null) theDocument["status"] = status;
      else theDocument["status"] = null;
    return theDocument;
  }

  @override
  FollowRequestEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static FollowRequestEntity? fromJsonString(String json) {
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

