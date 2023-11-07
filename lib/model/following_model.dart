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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_pkg_follow/model/following_entity.dart';

class FollowingModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_follow';
  static const String id = 'followings';

  // Member response ID - Member request ID
  @override
  String documentID;

  // This is the identifier of the app to which this belongs
  @override
  String appId;
  MemberPublicInfoModel? follower;
  MemberPublicInfoModel? followed;

  FollowingModel({
    required this.documentID,
    required this.appId,
    this.follower,
    this.followed,
  });

  @override
  FollowingModel copyWith({
    String? documentID,
    String? appId,
    MemberPublicInfoModel? follower,
    MemberPublicInfoModel? followed,
  }) {
    return FollowingModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      follower: follower ?? this.follower,
      followed: followed ?? this.followed,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      follower.hashCode ^
      followed.hashCode;

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

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (follower != null) {
      referencesCollector.add(ModelReference(MemberPublicInfoModel.packageName,
          MemberPublicInfoModel.id, follower!));
    }
    if (followed != null) {
      referencesCollector.add(ModelReference(MemberPublicInfoModel.packageName,
          MemberPublicInfoModel.id, followed!));
    }
    if (follower != null) {
      referencesCollector
          .addAll(await follower!.collectReferences(appId: appId));
    }
    if (followed != null) {
      referencesCollector
          .addAll(await followed!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  FollowingEntity toEntity({String? appId}) {
    return FollowingEntity(
      appId: appId,
      followerId: (follower != null) ? follower!.documentID : null,
      followedId: (followed != null) ? followed!.documentID : null,
    );
  }

  static Future<FollowingModel?> fromEntity(
      String documentID, FollowingEntity? entity) async {
    if (entity == null) return null;
    return FollowingModel(
      documentID: documentID,
      appId: entity.appId ?? '',
    );
  }

  static Future<FollowingModel?> fromEntityPlus(
      String documentID, FollowingEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    MemberPublicInfoModel? followerHolder;
    if (entity.followerId != null) {
      try {
        followerHolder = await memberPublicInfoRepository(appId: appId)!
            .get(entity.followerId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise follower');
        print(
            'Error whilst retrieving memberPublicInfo with id ${entity.followerId}');
        print('Exception: $e');
      }
    }

    MemberPublicInfoModel? followedHolder;
    if (entity.followedId != null) {
      try {
        followedHolder = await memberPublicInfoRepository(appId: appId)!
            .get(entity.followedId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise followed');
        print(
            'Error whilst retrieving memberPublicInfo with id ${entity.followedId}');
        print('Exception: $e');
      }
    }

    return FollowingModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      follower: followerHolder,
      followed: followedHolder,
    );
  }
}
