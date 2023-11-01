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
import 'package:eliud_core/core/base/entity_base.dart';

class FollowingArrayEntity implements EntityBase {
  final String? appId;
  final List<String>? followers;

  FollowingArrayEntity({required this.appId, this.followers, });

  FollowingArrayEntity copyWith({String? documentID, String? appId, List<String>? followers, }) {
    return FollowingArrayEntity(appId : appId ?? this.appId, followers : followers ?? this.followers, );
  }
  List<Object?> get props => [appId, followers, ];

  @override
  String toString() {
    String followersCsv = (followers == null) ? '' : followers!.join(', ');

    return 'FollowingArrayEntity{appId: $appId, followers: String[] { $followersCsv }}';
  }

  static FollowingArrayEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
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

  @override
  FollowingArrayEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static FollowingArrayEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

