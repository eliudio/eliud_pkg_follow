/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

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


import 'package:eliud_pkg_follow/model/following_entity.dart';

import 'package:eliud_core/tools/random.dart';



class FollowingModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_follow';
  static const String id = 'Following';


  // Member response ID - Member request ID
  String documentID;

  // This is the identifier of the app to which this belongs
  String appId;
  MemberPublicInfoModel? follower;
  MemberPublicInfoModel? followed;

  FollowingModel({required this.documentID, required this.appId, this.follower, this.followed, })  {
    assert(documentID != null);
  }

  FollowingModel copyWith({String? documentID, String? appId, MemberPublicInfoModel? follower, MemberPublicInfoModel? followed, }) {
    return FollowingModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, follower: follower ?? this.follower, followed: followed ?? this.followed, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ follower.hashCode ^ followed.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is FollowingModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          follower == other.follower &&
          followed == other.followed;

  @override
  String toString() {
    return 'FollowingModel{documentID: $documentID, appId: $appId, follower: $follower, followed: $followed}';
  }

  FollowingEntity toEntity({String? appId, List<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
      if (follower != null) referencesCollector.add(ModelReference(MemberPublicInfoModel.packageName, MemberPublicInfoModel.id, follower!));
      if (followed != null) referencesCollector.add(ModelReference(MemberPublicInfoModel.packageName, MemberPublicInfoModel.id, followed!));
    }
    return FollowingEntity(
          appId: (appId != null) ? appId : null, 
          followerId: (follower != null) ? follower!.documentID : null, 
          followedId: (followed != null) ? followed!.documentID : null, 
    );
  }

  static Future<FollowingModel?> fromEntity(String documentID, FollowingEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return FollowingModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
    );
  }

  static Future<FollowingModel?> fromEntityPlus(String documentID, FollowingEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    MemberPublicInfoModel? followerHolder;
    if (entity.followerId != null) {
      try {
          followerHolder = await memberPublicInfoRepository(appId: appId)!.get(entity.followerId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise follower');
        print('Error whilst retrieving memberPublicInfo with id ${entity.followerId}');
        print('Exception: $e');
      }
    }

    MemberPublicInfoModel? followedHolder;
    if (entity.followedId != null) {
      try {
          followedHolder = await memberPublicInfoRepository(appId: appId)!.get(entity.followedId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise followed');
        print('Error whilst retrieving memberPublicInfo with id ${entity.followedId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return FollowingModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          follower: followerHolder, 
          followed: followedHolder, 
    );
  }

}

