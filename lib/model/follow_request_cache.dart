/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_pkg_follow/model/follow_request_model.dart';
import 'package:eliud_pkg_follow/model/follow_request_repository.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

class FollowRequestCache implements FollowRequestRepository {

  final FollowRequestRepository reference;
  final Map<String?, FollowRequestModel?> fullCache = Map();

  FollowRequestCache(this.reference);

  Future<FollowRequestModel> add(FollowRequestModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<FollowRequestEntity> addEntity(String documentID, FollowRequestEntity value) {
    return reference.addEntity(documentID, value);
  }

  Future<FollowRequestEntity> updateEntity(String documentID, FollowRequestEntity value) {
    return reference.updateEntity(documentID, value);
  }

  Future<void> delete(FollowRequestModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<FollowRequestModel?> get(String? id, {Function(Exception)? onError}) async {
    var value = fullCache[id];
    if (value != null) return refreshRelations(value);
    value = await reference.get(id, onError: onError);
    fullCache[id] = value;
    return value;
  }

  Future<FollowRequestModel> update(FollowRequestModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<FollowRequestModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    return reference.values(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Stream<List<FollowRequestModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    return reference.valuesWithDetails(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Future<List<FollowRequestModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    return await reference.valuesList(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }
  
  @override
  Future<List<FollowRequestModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    return await reference.valuesListWithDetails(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  void flush() {
    fullCache.clear();
  }
  
  String? timeStampToString(dynamic timeStamp) {
    return reference.timeStampToString(timeStamp);
  } 

  dynamic getSubCollection(String documentId, String name) {
    return reference.getSubCollection(documentId, name);
  }

  Future<FollowRequestModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    return reference.changeValue(documentId, fieldName, changeByThisValue).then((newValue) {
      fullCache[documentId] = newValue;
      return newValue!;
    });
  }

  @override
  Future<FollowRequestEntity?> getEntity(String? id, {Function(Exception p1)? onError}) {
    return reference.getEntity(id, onError: onError);
  }

  @override
  FollowRequestEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return reference.fromMap(o, newDocumentIds: newDocumentIds);
  }

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<FollowRequestModel?>> listen(trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<List<FollowRequestModel?>> listenWithDetails(trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    return reference.listenWithDetails(trigger, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<FollowRequestModel?> listenTo(String documentId, FollowRequestChanged changed, {FollowRequestErrorHandler? errorHandler}) {
    return reference.listenTo(documentId, ((value) {
      if (value != null) {
        fullCache[value.documentID] = value;
      }
      changed(value);
    }), errorHandler: errorHandler);
  }

  static Future<FollowRequestModel> refreshRelations(FollowRequestModel model) async {

    MemberPublicInfoModel? followerHolder;
    if (model.follower != null) {
      try {
        await memberPublicInfoRepository(appId: model.appId)!.get(model.follower!.documentID).then((val) {
          followerHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    MemberPublicInfoModel? followedHolder;
    if (model.followed != null) {
      try {
        await memberPublicInfoRepository(appId: model.appId)!.get(model.followed!.documentID).then((val) {
          followedHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        follower: followerHolder,

        followed: followedHolder,


    );
  }

}

