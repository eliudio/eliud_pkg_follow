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

typedef FollowRequestsDashboardModelTrigger(List<FollowRequestsDashboardModel?> list);
typedef FollowRequestsDashboardChanged(FollowRequestsDashboardModel? value);
typedef FollowRequestsDashboardErrorHandler(o, e);

abstract class FollowRequestsDashboardRepository extends RepositoryBase<FollowRequestsDashboardModel, FollowRequestsDashboardEntity> {
  Future<FollowRequestsDashboardEntity> addEntity(String documentID, FollowRequestsDashboardEntity value);
  Future<FollowRequestsDashboardEntity> updateEntity(String documentID, FollowRequestsDashboardEntity value);
  Future<FollowRequestsDashboardModel> add(FollowRequestsDashboardModel value);
  Future<void> delete(FollowRequestsDashboardModel value);
  Future<FollowRequestsDashboardModel?> get(String? id, { Function(Exception)? onError });
  Future<FollowRequestsDashboardModel> update(FollowRequestsDashboardModel value);

  Stream<List<FollowRequestsDashboardModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<FollowRequestsDashboardModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<FollowRequestsDashboardModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<FollowRequestsDashboardModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<FollowRequestsDashboardModel?>> listen(FollowRequestsDashboardModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<FollowRequestsDashboardModel?>> listenWithDetails(FollowRequestsDashboardModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<FollowRequestsDashboardModel?> listenTo(String documentId, FollowRequestsDashboardChanged changed, {FollowRequestsDashboardErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<FollowRequestsDashboardModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


