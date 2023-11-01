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
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef FollowingDashboardModelTrigger(List<FollowingDashboardModel?> list);
typedef FollowingDashboardChanged(FollowingDashboardModel? value);
typedef FollowingDashboardErrorHandler(o, e);

abstract class FollowingDashboardRepository extends RepositoryBase<FollowingDashboardModel, FollowingDashboardEntity> {
  Future<FollowingDashboardEntity> addEntity(String documentID, FollowingDashboardEntity value);
  Future<FollowingDashboardEntity> updateEntity(String documentID, FollowingDashboardEntity value);
  Future<FollowingDashboardModel> add(FollowingDashboardModel value);
  Future<void> delete(FollowingDashboardModel value);
  Future<FollowingDashboardModel?> get(String? id, { Function(Exception)? onError });
  Future<FollowingDashboardModel> update(FollowingDashboardModel value);

  Stream<List<FollowingDashboardModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<FollowingDashboardModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<FollowingDashboardModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<FollowingDashboardModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<FollowingDashboardModel?>> listen(FollowingDashboardModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<FollowingDashboardModel?>> listenWithDetails(FollowingDashboardModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<FollowingDashboardModel?> listenTo(String documentId, FollowingDashboardChanged changed, {FollowingDashboardErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<FollowingDashboardModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


