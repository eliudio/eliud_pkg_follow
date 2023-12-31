import 'dart:async';
import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/access_event.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_main/model/component_registry.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';
import 'package:eliud_core_model/model/access_model.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_pkg_etc/etc_package.dart';
import 'package:eliud_pkg_follow_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_model.dart';
import 'package:eliud_pkg_follow_model/model/repository_singleton.dart';
import 'package:eliud_pkg_notifications/notifications_package.dart';

import 'package:eliud_pkg_follow/follow_package_stub.dart'
    if (dart.library.io) 'follow_mobile_package.dart'
    if (dart.library.html) 'follow_web_package.dart';

abstract class FollowPackage extends Package {
  FollowPackage() : super('eliud_pkg_follow');

  static final String conditionMemberHasOpenRequests =
      'Has Open Follow Requests';
  final Map<String, bool?> stateConditionMemberHasOpenRequests = {};
  final Map<String, StreamSubscription<List<FollowRequestModel?>>>
      subscription = {};

  static EliudQuery getOpenFollowRequestsQuery(
      String appId, String assigneeId) {
    return EliudQuery(theConditions: [
      EliudQueryCondition('followedId', isEqualTo: assigneeId),
      EliudQueryCondition('appId', isEqualTo: appId),
      EliudQueryCondition('status',
          isEqualTo: FollowRequestStatus.followRequestPending.index)
    ]);
  }

  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(
      AccessBloc accessBloc,
      AppModel app,
      MemberModel? member,
      bool isOwner,
      bool? isBlocked,
      PrivilegeLevel? privilegeLevel) {
    String appId = app.documentID;
    subscription[appId]?.cancel();
    if (member != null) {
      final c = Completer<List<PackageConditionDetails>>();
      subscription[appId] =
          followRequestRepository(appId: appId)!.listen((list) {
        // If we have a different set of assignments, i.e. it has assignments were before it didn't or vice versa,
        // then we must inform the AccessBloc, so that it can refresh the state
        var value = list.isNotEmpty;
        if (!c.isCompleted) {
          // the first time we get this trigger, it's upon entry of the getAndSubscribe. Now we simply return the value
          stateConditionMemberHasOpenRequests[appId] = value;
          c.complete([
            PackageConditionDetails(
                packageName: packageName,
                conditionName: conditionMemberHasOpenRequests,
                value: value)
          ]);
        } else {
          // subsequent calls we get this trigger, it's when the date has changed. Now add the event to the bloc
          if (value != stateConditionMemberHasOpenRequests[appId]) {
            stateConditionMemberHasOpenRequests[appId] = value;
            accessBloc.add(UpdatePackageConditionEvent(
                app, this, conditionMemberHasOpenRequests, value));
          }
        }
      }, eliudQuery: getOpenFollowRequestsQuery(appId, member.documentID));
      return c.future;
    } else {
      stateConditionMemberHasOpenRequests[appId] = false;
      return Future.value([
        PackageConditionDetails(
            packageName: packageName,
            conditionName: conditionMemberHasOpenRequests,
            value: false)
      ]);
    }
  }

  @override
  List<String> retrieveAllPackageConditions() {
    return [conditionMemberHasOpenRequests];
  }

  @override
  void init() {
    ComponentRegistry().init();

    AbstractRepositorySingleton.singleton = RepositorySingleton();
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() =>
      AbstractRepositorySingleton.collections;

  static FollowPackage instance() => getFollowPackage();

  /*
   * Register depending packages
   */
  @override
  void registerDependencies(Eliud eliud) {
    eliud.registerPackage(CorePackage.instance());
    eliud.registerPackage(NotificationsPackage.instance());
    eliud.registerPackage(EtcPackage.instance());
  }
}
