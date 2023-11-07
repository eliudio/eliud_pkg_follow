/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/following_firestore.dart';
import '../model/following_repository.dart';
import '../model/following_cache.dart';
import '../model/following_dashboard_firestore.dart';
import '../model/following_dashboard_repository.dart';
import '../model/following_dashboard_cache.dart';
import '../model/follow_request_firestore.dart';
import '../model/follow_request_repository.dart';
import '../model/follow_request_cache.dart';
import '../model/follow_requests_dashboard_firestore.dart';
import '../model/follow_requests_dashboard_repository.dart';
import '../model/follow_requests_dashboard_cache.dart';
import '../model/invite_dashboard_firestore.dart';
import '../model/invite_dashboard_repository.dart';
import '../model/invite_dashboard_cache.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
  final _followingRepository = HashMap<String, FollowingRepository>();
  final _followingDashboardRepository =
      HashMap<String, FollowingDashboardRepository>();
  final _followRequestRepository = HashMap<String, FollowRequestRepository>();
  final _followRequestsDashboardRepository =
      HashMap<String, FollowRequestsDashboardRepository>();
  final _inviteDashboardRepository =
      HashMap<String, InviteDashboardRepository>();

  @override
  FollowingRepository? followingRepository(String? appId) {
    if ((appId != null) && (_followingRepository[appId] == null)) {
      _followingRepository[appId] = FollowingCache(FollowingFirestore(
          () => appRepository()!.getSubCollection(appId, 'following'), appId));
    }
    return _followingRepository[appId];
  }

  @override
  FollowingDashboardRepository? followingDashboardRepository(String? appId) {
    if ((appId != null) && (_followingDashboardRepository[appId] == null)) {
      _followingDashboardRepository[appId] = FollowingDashboardCache(
          FollowingDashboardFirestore(
              () => appRepository()!
                  .getSubCollection(appId, 'followingdashboard'),
              appId));
    }
    return _followingDashboardRepository[appId];
  }

  @override
  FollowRequestRepository? followRequestRepository(String? appId) {
    if ((appId != null) && (_followRequestRepository[appId] == null)) {
      _followRequestRepository[appId] = FollowRequestCache(
          FollowRequestFirestore(
              () => appRepository()!.getSubCollection(appId, 'followrequest'),
              appId));
    }
    return _followRequestRepository[appId];
  }

  @override
  FollowRequestsDashboardRepository? followRequestsDashboardRepository(
      String? appId) {
    if ((appId != null) &&
        (_followRequestsDashboardRepository[appId] == null)) {
      _followRequestsDashboardRepository[appId] = FollowRequestsDashboardCache(
          FollowRequestsDashboardFirestore(
              () => appRepository()!
                  .getSubCollection(appId, 'followrequestsdashboard'),
              appId));
    }
    return _followRequestsDashboardRepository[appId];
  }

  @override
  InviteDashboardRepository? inviteDashboardRepository(String? appId) {
    if ((appId != null) && (_inviteDashboardRepository[appId] == null)) {
      _inviteDashboardRepository[appId] = InviteDashboardCache(
          InviteDashboardFirestore(
              () => appRepository()!.getSubCollection(appId, 'invitedashboard'),
              appId));
    }
    return _inviteDashboardRepository[appId];
  }
}
