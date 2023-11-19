/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef InviteDashboardModelTrigger = Function(
    List<InviteDashboardModel?> list);
typedef InviteDashboardChanged = Function(InviteDashboardModel? value);
typedef InviteDashboardErrorHandler = Function(dynamic o, dynamic e);

abstract class InviteDashboardRepository
    extends RepositoryBase<InviteDashboardModel, InviteDashboardEntity> {
  @override
  Future<InviteDashboardEntity> addEntity(
      String documentID, InviteDashboardEntity value);
  @override
  Future<InviteDashboardEntity> updateEntity(
      String documentID, InviteDashboardEntity value);
  @override
  Future<InviteDashboardModel> add(InviteDashboardModel value);
  @override
  Future<void> delete(InviteDashboardModel value);
  @override
  Future<InviteDashboardModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<InviteDashboardModel> update(InviteDashboardModel value);

  @override
  Stream<List<InviteDashboardModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<InviteDashboardModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<InviteDashboardModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<InviteDashboardModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<InviteDashboardModel?>> listen(
      InviteDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<InviteDashboardModel?>> listenWithDetails(
      InviteDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<InviteDashboardModel?> listenTo(
      String documentId, InviteDashboardChanged changed,
      {InviteDashboardErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<InviteDashboardModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
