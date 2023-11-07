/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/following_repository.dart';
import '../model/following_dashboard_repository.dart';
import '../model/follow_request_repository.dart';
import '../model/follow_requests_dashboard_repository.dart';
import '../model/invite_dashboard_repository.dart';
import 'package:eliud_core/package/package.dart';

FollowingRepository? followingRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.followingRepository(appId);
FollowingDashboardRepository? followingDashboardRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.followingDashboardRepository(appId);
FollowRequestRepository? followRequestRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.followRequestRepository(appId);
FollowRequestsDashboardRepository? followRequestsDashboardRepository(
        {String? appId}) =>
    AbstractRepositorySingleton.singleton
        .followRequestsDashboardRepository(appId);
InviteDashboardRepository? inviteDashboardRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.inviteDashboardRepository(appId);

abstract class AbstractRepositorySingleton {
  static List<MemberCollectionInfo> collections = [];
  static late AbstractRepositorySingleton singleton;

  FollowingRepository? followingRepository(String? appId);
  FollowingDashboardRepository? followingDashboardRepository(String? appId);
  FollowRequestRepository? followRequestRepository(String? appId);
  FollowRequestsDashboardRepository? followRequestsDashboardRepository(
      String? appId);
  InviteDashboardRepository? inviteDashboardRepository(String? appId);

  void flush(String? appId) {
    followingRepository(appId)!.flush();
    followingDashboardRepository(appId)!.flush();
    followRequestRepository(appId)!.flush();
    followRequestsDashboardRepository(appId)!.flush();
    inviteDashboardRepository(appId)!.flush();
  }
}
