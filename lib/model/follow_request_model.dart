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


import 'package:eliud_pkg_follow/model/follow_request_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum FollowRequestStatus {
  FollowRequestPending, FollowRequestAccepted, FollowRequestDenied, Unknown
}


FollowRequestStatus toFollowRequestStatus(int index) {
  switch (index) {
    case 0: return FollowRequestStatus.FollowRequestPending;
    case 1: return FollowRequestStatus.FollowRequestAccepted;
    case 2: return FollowRequestStatus.FollowRequestDenied;
  }
  return FollowRequestStatus.Unknown;
}


class FollowRequestModel {

  // Member request ID - Member response ID
  String documentID;

  // This is the identifier of the app to which this belongs
  String appId;
  MemberPublicInfoModel follower;
  MemberPublicInfoModel followed;
  FollowRequestStatus status;

  FollowRequestModel({this.documentID, this.appId, this.follower, this.followed, this.status, })  {
    assert(documentID != null);
  }

  FollowRequestModel copyWith({String documentID, String appId, MemberPublicInfoModel follower, MemberPublicInfoModel followed, FollowRequestStatus status, }) {
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

  FollowRequestEntity toEntity({String appId}) {
    return FollowRequestEntity(
          appId: (appId != null) ? appId : null, 
          followerId: (follower != null) ? follower.documentID : null, 
          followedId: (followed != null) ? followed.documentID : null, 
          status: (status != null) ? status.index : null, 
    );
  }

  static FollowRequestModel fromEntity(String documentID, FollowRequestEntity entity) {
    if (entity == null) return null;
    return FollowRequestModel(
          documentID: documentID, 
          appId: entity.appId, 
          status: toFollowRequestStatus(entity.status), 
    );
  }

  static Future<FollowRequestModel> fromEntityPlus(String documentID, FollowRequestEntity entity, { String appId}) async {
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

    return FollowRequestModel(
          documentID: documentID, 
          appId: entity.appId, 
          follower: followerHolder, 
          followed: followedHolder, 
          status: toFollowRequestStatus(entity.status), 
    );
  }

}

