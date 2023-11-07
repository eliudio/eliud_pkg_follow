/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_requests_dashboard_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef FollowRequestsDashboardModelTrigger = Function(
    List<FollowRequestsDashboardModel?> list);
typedef FollowRequestsDashboardChanged = Function(
    FollowRequestsDashboardModel? value);
typedef FollowRequestsDashboardErrorHandler = Function(dynamic o, dynamic e);

abstract class FollowRequestsDashboardRepository extends RepositoryBase<
    FollowRequestsDashboardModel, FollowRequestsDashboardEntity> {
  @override
  Future<FollowRequestsDashboardEntity> addEntity(
      String documentID, FollowRequestsDashboardEntity value);
  @override
  Future<FollowRequestsDashboardEntity> updateEntity(
      String documentID, FollowRequestsDashboardEntity value);
  @override
  Future<FollowRequestsDashboardModel> add(FollowRequestsDashboardModel value);
  @override
  Future<void> delete(FollowRequestsDashboardModel value);
  @override
  Future<FollowRequestsDashboardModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<FollowRequestsDashboardModel> update(
      FollowRequestsDashboardModel value);

  @override
  Stream<List<FollowRequestsDashboardModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<FollowRequestsDashboardModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<FollowRequestsDashboardModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<FollowRequestsDashboardModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<FollowRequestsDashboardModel?>> listen(
      FollowRequestsDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<FollowRequestsDashboardModel?>> listenWithDetails(
      FollowRequestsDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<FollowRequestsDashboardModel?> listenTo(
      String documentId, FollowRequestsDashboardChanged changed,
      {FollowRequestsDashboardErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<FollowRequestsDashboardModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
