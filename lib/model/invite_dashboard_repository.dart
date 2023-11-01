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
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef InviteDashboardModelTrigger(List<InviteDashboardModel?> list);
typedef InviteDashboardChanged(InviteDashboardModel? value);
typedef InviteDashboardErrorHandler(o, e);

abstract class InviteDashboardRepository extends RepositoryBase<InviteDashboardModel, InviteDashboardEntity> {
  Future<InviteDashboardEntity> addEntity(String documentID, InviteDashboardEntity value);
  Future<InviteDashboardEntity> updateEntity(String documentID, InviteDashboardEntity value);
  Future<InviteDashboardModel> add(InviteDashboardModel value);
  Future<void> delete(InviteDashboardModel value);
  Future<InviteDashboardModel?> get(String? id, { Function(Exception)? onError });
  Future<InviteDashboardModel> update(InviteDashboardModel value);

  Stream<List<InviteDashboardModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<InviteDashboardModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<InviteDashboardModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<InviteDashboardModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<InviteDashboardModel?>> listen(InviteDashboardModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<InviteDashboardModel?>> listenWithDetails(InviteDashboardModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<InviteDashboardModel?> listenTo(String documentId, InviteDashboardChanged changed, {InviteDashboardErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<InviteDashboardModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


