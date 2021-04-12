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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

class FollowingEntity {
  final String? appId;
  final String? followerId;
  final String? followedId;

  FollowingEntity({this.appId, this.followerId, this.followedId, });


  List<Object?> get props => [appId, followerId, followedId, ];

  @override
  String toString() {
    return 'FollowingEntity{appId: $appId, followerId: $followerId, followedId: $followedId}';
  }

  static FollowingEntity? fromMap(Map? map) {
    if (map == null) return null;

    return FollowingEntity(
      appId: map['appId'], 
      followerId: map['followerId'], 
      followedId: map['followedId'], 
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
    return theDocument;
  }

  static FollowingEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

