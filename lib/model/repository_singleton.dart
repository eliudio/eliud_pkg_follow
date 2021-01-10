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

import '../model/following_model.dart';
import '../model/follow_request_model.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
    var _followingRepository = HashMap<String, FollowingRepository>();
    var _followingDashboardRepository = HashMap<String, FollowingDashboardRepository>();
    var _followRequestRepository = HashMap<String, FollowRequestRepository>();
    var _followRequestsDashboardRepository = HashMap<String, FollowRequestsDashboardRepository>();
    var _inviteDashboardRepository = HashMap<String, InviteDashboardRepository>();

    FollowingRepository followingRepository(String appId) {
      if (_followingRepository[appId] == null) _followingRepository[appId] = FollowingCache(FollowingFirestore(appRepository().getSubCollection(appId, 'following'), appId));
      return _followingRepository[appId];
    }
    FollowingDashboardRepository followingDashboardRepository(String appId) {
      if (_followingDashboardRepository[appId] == null) _followingDashboardRepository[appId] = FollowingDashboardCache(FollowingDashboardFirestore(appRepository().getSubCollection(appId, 'followingdashboard'), appId));
      return _followingDashboardRepository[appId];
    }
    FollowRequestRepository followRequestRepository(String appId) {
      if (_followRequestRepository[appId] == null) _followRequestRepository[appId] = FollowRequestCache(FollowRequestFirestore(appRepository().getSubCollection(appId, 'followrequest'), appId));
      return _followRequestRepository[appId];
    }
    FollowRequestsDashboardRepository followRequestsDashboardRepository(String appId) {
      if (_followRequestsDashboardRepository[appId] == null) _followRequestsDashboardRepository[appId] = FollowRequestsDashboardCache(FollowRequestsDashboardFirestore(appRepository().getSubCollection(appId, 'followrequestsdashboard'), appId));
      return _followRequestsDashboardRepository[appId];
    }
    InviteDashboardRepository inviteDashboardRepository(String appId) {
      if (_inviteDashboardRepository[appId] == null) _inviteDashboardRepository[appId] = InviteDashboardCache(InviteDashboardFirestore(appRepository().getSubCollection(appId, 'invitedashboard'), appId));
      return _inviteDashboardRepository[appId];
    }

}
