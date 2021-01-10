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

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_membership/model/repository_export.dart';
import 'package:eliud_pkg_membership/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_membership/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_membership/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';


import 'package:eliud_pkg_follow/model/following_entity.dart';

import 'package:eliud_core/tools/random.dart';



class FollowingModel {

  // Member response ID - Member request ID
  String documentID;

  // This is the identifier of the app to which this belongs
  String appId;
  MemberPublicInfoModel follower;
  MemberPublicInfoModel followed;

  FollowingModel({this.documentID, this.appId, this.follower, this.followed, })  {
    assert(documentID != null);
  }

  FollowingModel copyWith({String documentID, String appId, MemberPublicInfoModel follower, MemberPublicInfoModel followed, }) {
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

  FollowingEntity toEntity({String appId}) {
    return FollowingEntity(
          appId: (appId != null) ? appId : null, 
          followerId: (follower != null) ? follower.documentID : null, 
          followedId: (followed != null) ? followed.documentID : null, 
    );
  }

  static FollowingModel fromEntity(String documentID, FollowingEntity entity) {
    if (entity == null) return null;
    return FollowingModel(
          documentID: documentID, 
          appId: entity.appId, 
    );
  }

  static Future<FollowingModel> fromEntityPlus(String documentID, FollowingEntity entity, { String appId}) async {
    if (entity == null) return null;

    MemberPublicInfoModel followerHolder;
    if (entity.followerId != null) {
      try {
        await memberPublicInfoRepository(appId: appId).get(entity.followerId).then((val) {
          followerHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    MemberPublicInfoModel followedHolder;
    if (entity.followedId != null) {
      try {
        await memberPublicInfoRepository(appId: appId).get(entity.followedId).then((val) {
          followedHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return FollowingModel(
          documentID: documentID, 
          appId: entity.appId, 
          follower: followerHolder, 
          followed: followedHolder, 
    );
  }

}

