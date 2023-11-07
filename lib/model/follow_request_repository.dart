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

import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef FollowRequestModelTrigger = Function(List<FollowRequestModel?> list);
typedef FollowRequestChanged = Function(FollowRequestModel? value);
typedef FollowRequestErrorHandler = Function(dynamic o, dynamic e);

abstract class FollowRequestRepository
    extends RepositoryBase<FollowRequestModel, FollowRequestEntity> {
  @override
  Future<FollowRequestEntity> addEntity(
      String documentID, FollowRequestEntity value);
  @override
  Future<FollowRequestEntity> updateEntity(
      String documentID, FollowRequestEntity value);
  @override
  Future<FollowRequestModel> add(FollowRequestModel value);
  @override
  Future<void> delete(FollowRequestModel value);
  @override
  Future<FollowRequestModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<FollowRequestModel> update(FollowRequestModel value);

  @override
  Stream<List<FollowRequestModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<FollowRequestModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<FollowRequestModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<FollowRequestModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<FollowRequestModel?>> listen(
      FollowRequestModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<FollowRequestModel?>> listenWithDetails(
      FollowRequestModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<FollowRequestModel?> listenTo(
      String documentId, FollowRequestChanged changed,
      {FollowRequestErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<FollowRequestModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
