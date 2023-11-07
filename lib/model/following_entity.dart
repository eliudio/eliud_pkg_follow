/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';

class FollowingEntity implements EntityBase {
  final String? appId;
  final String? followerId;
  final String? followedId;

  FollowingEntity({
    required this.appId,
    this.followerId,
    this.followedId,
  });

  FollowingEntity copyWith({
    String? documentID,
    String? appId,
    String? followerId,
    String? followedId,
  }) {
    return FollowingEntity(
      appId: appId ?? this.appId,
      followerId: followerId ?? this.followerId,
      followedId: followedId ?? this.followedId,
    );
  }

  List<Object?> get props => [
        appId,
        followerId,
        followedId,
      ];

  @override
  String toString() {
    return 'FollowingEntity{appId: $appId, followerId: $followerId, followedId: $followedId}';
  }

  static FollowingEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return FollowingEntity(
      appId: map['appId'],
      followerId: map['followerId'],
      followedId: map['followedId'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (followerId != null) {
      theDocument["followerId"] = followerId;
    } else {
      theDocument["followerId"] = null;
    }
    if (followedId != null) {
      theDocument["followedId"] = followedId;
    } else {
      theDocument["followedId"] = null;
    }
    return theDocument;
  }

  @override
  FollowingEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static FollowingEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
