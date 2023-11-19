/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef FollowingDashboardModelTrigger = Function(
    List<FollowingDashboardModel?> list);
typedef FollowingDashboardChanged = Function(FollowingDashboardModel? value);
typedef FollowingDashboardErrorHandler = Function(dynamic o, dynamic e);

abstract class FollowingDashboardRepository
    extends RepositoryBase<FollowingDashboardModel, FollowingDashboardEntity> {
  @override
  Future<FollowingDashboardEntity> addEntity(
      String documentID, FollowingDashboardEntity value);
  @override
  Future<FollowingDashboardEntity> updateEntity(
      String documentID, FollowingDashboardEntity value);
  @override
  Future<FollowingDashboardModel> add(FollowingDashboardModel value);
  @override
  Future<void> delete(FollowingDashboardModel value);
  @override
  Future<FollowingDashboardModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<FollowingDashboardModel> update(FollowingDashboardModel value);

  @override
  Stream<List<FollowingDashboardModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<FollowingDashboardModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<FollowingDashboardModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<FollowingDashboardModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<FollowingDashboardModel?>> listen(
      FollowingDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<FollowingDashboardModel?>> listenWithDetails(
      FollowingDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<FollowingDashboardModel?> listenTo(
      String documentId, FollowingDashboardChanged changed,
      {FollowingDashboardErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<FollowingDashboardModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
