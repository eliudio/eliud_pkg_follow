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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

class FollowRequestEntity {
  final String? appId;
  final String? followerId;
  final String? followedId;
  final int? status;

  FollowRequestEntity({this.appId, this.followerId, this.followedId, this.status, });


  List<Object?> get props => [appId, followerId, followedId, status, ];

  @override
  String toString() {
    return 'FollowRequestEntity{appId: $appId, followerId: $followerId, followedId: $followedId, status: $status}';
  }

  static FollowRequestEntity? fromMap(Map? map) {
    if (map == null) return null;

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

  static FollowRequestEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

