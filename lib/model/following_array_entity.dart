/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_array_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class FollowingArrayEntity {
  final String? appId;
  final List<String>? followers;

  FollowingArrayEntity({this.appId, this.followers, });


  List<Object?> get props => [appId, followers, ];

  @override
  String toString() {
    String followersCsv = (followers == null) ? '' : followers!.join(', ');

    return 'FollowingArrayEntity{appId: $appId, followers: String[] { $followersCsv }}';
  }

  static FollowingArrayEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return FollowingArrayEntity(
      appId: map['appId'], 
      followers: map['followers'] == null ? null : List.from(map['followers']), 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (followers != null) theDocument["followers"] = followers!.toList();
      else theDocument["followers"] = null;
    return theDocument;
  }

  static FollowingArrayEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}
