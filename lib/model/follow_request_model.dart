/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';


import 'package:eliud_pkg_follow/model/follow_request_entity.dart';


enum FollowRequestStatus {
  FollowRequestPending, FollowRequestAccepted, FollowRequestDenied, Unknown
}


FollowRequestStatus toFollowRequestStatus(int? index) {
  switch (index) {
    case 0: return FollowRequestStatus.FollowRequestPending;
    case 1: return FollowRequestStatus.FollowRequestAccepted;
    case 2: return FollowRequestStatus.FollowRequestDenied;
  }
  return FollowRequestStatus.Unknown;
}


class FollowRequestModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_follow';
  static const String id = 'followRequests';


  // Member request ID - Member response ID
  String documentID;

  // This is the identifier of the app to which this belongs
  String appId;
  MemberPublicInfoModel? follower;
  MemberPublicInfoModel? followed;
  FollowRequestStatus? status;

  FollowRequestModel({required this.documentID, required this.appId, this.follower, this.followed, this.status, });

  FollowRequestModel copyWith({String? documentID, String? appId, MemberPublicInfoModel? follower, MemberPublicInfoModel? followed, FollowRequestStatus? status, }) {
    return FollowRequestModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, follower: follower ?? this.follower, followed: followed ?? this.followed, status: status ?? this.status, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ follower.hashCode ^ followed.hashCode ^ status.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is FollowRequestModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          follower == other.follower &&
          followed == other.followed &&
          status == other.status;

  @override
  String toString() {
    return 'FollowRequestModel{documentID: $documentID, appId: $appId, follower: $follower, followed: $followed, status: $status}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (follower != null) {
      referencesCollector.add(ModelReference(MemberPublicInfoModel.packageName, MemberPublicInfoModel.id, follower!));
    }
    if (followed != null) {
      referencesCollector.add(ModelReference(MemberPublicInfoModel.packageName, MemberPublicInfoModel.id, followed!));
    }
    if (follower != null) referencesCollector.addAll(await follower!.collectReferences(appId: appId));
    if (followed != null) referencesCollector.addAll(await followed!.collectReferences(appId: appId));
    return referencesCollector;
  }

  FollowRequestEntity toEntity({String? appId}) {
    return FollowRequestEntity(
          appId: (appId != null) ? appId : null, 
          followerId: (follower != null) ? follower!.documentID : null, 
          followedId: (followed != null) ? followed!.documentID : null, 
          status: (status != null) ? status!.index : null, 
    );
  }

  static Future<FollowRequestModel?> fromEntity(String documentID, FollowRequestEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return FollowRequestModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          status: toFollowRequestStatus(entity.status), 
    );
  }

  static Future<FollowRequestModel?> fromEntityPlus(String documentID, FollowRequestEntity? entity, { String? appId}) async {
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
    return FollowRequestModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          follower: followerHolder, 
          followed: followedHolder, 
          status: toFollowRequestStatus(entity.status), 
    );
  }

}

