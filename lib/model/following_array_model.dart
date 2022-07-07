/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_array_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';


import 'package:eliud_pkg_follow/model/following_array_entity.dart';

import 'package:eliud_core/tools/random.dart';



class FollowingArrayModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_follow';
  static const String id = 'FollowingArray';


  // Member ID
  String documentID;

  // This is the identifier of the app to which this belongs
  String appId;
  List<String>? followers;

  FollowingArrayModel({required this.documentID, required this.appId, this.followers, })  {
    assert(documentID != null);
  }

  FollowingArrayModel copyWith({String? documentID, String? appId, List<String>? followers, }) {
    return FollowingArrayModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, followers: followers ?? this.followers, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ followers.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is FollowingArrayModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          ListEquality().equals(followers, other.followers);

  @override
  String toString() {
    String followersCsv = (followers == null) ? '' : followers!.join(', ');

    return 'FollowingArrayModel{documentID: $documentID, appId: $appId, followers: String[] { $followersCsv }}';
  }

  FollowingArrayEntity toEntity({String? appId, List<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
    }
    return FollowingArrayEntity(
          appId: (appId != null) ? appId : null, 
          followers: (followers != null) ? followers : null, 
    );
  }

  static Future<FollowingArrayModel?> fromEntity(String documentID, FollowingArrayEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return FollowingArrayModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          followers: entity.followers, 
    );
  }

  static Future<FollowingArrayModel?> fromEntityPlus(String documentID, FollowingArrayEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return FollowingArrayModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          followers: entity.followers, 
    );
  }

}

