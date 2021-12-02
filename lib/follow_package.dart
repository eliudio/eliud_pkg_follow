import 'dart:async';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'model/component_registry.dart';
import 'model/follow_request_model.dart';
import 'model/abstract_repository_singleton.dart';
import 'model/repository_singleton.dart';

abstract class FollowPackage extends Package {
  FollowPackage() : super('eliud_pkg_follow');

  static final String CONDITION_MEMBER_HAS_OPEN_REQUESTS = 'Has Open Follow Requests';
  Map<String, bool?> stateCONDITION_MEMBER_HAS_OPEN_REQUESTS = {};
  Map<String, StreamSubscription<List<FollowRequestModel?>>> subscription = {};

  static EliudQuery getOpenFollowRequestsQuery(String appId, String assigneeId) {
    return EliudQuery(
        theConditions: [
          EliudQueryCondition('followedId', isEqualTo: assigneeId),
          EliudQueryCondition('appId', isEqualTo: appId),
          EliudQueryCondition('status', isEqualTo: FollowRequestStatus.FollowRequestPending.index)
        ]
    );
  }

  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(AccessBloc accessBloc, AppModel app, MemberModel? member, bool isOwner, bool? isBlocked, PrivilegeLevel? privilegeLevel) {
    String appId = app.documentID!;
    subscription[appId]?.cancel();
    if (member != null) {
      final c = Completer<List<PackageConditionDetails>>();
      subscription[appId] = followRequestRepository(appId: appId)!.listen((list) {
        // If we have a different set of assignments, i.e. it has assignments were before it didn't or vice versa,
        // then we must inform the AccessBloc, so that it can refresh the state
        var value = list.length > 0;
        if (!c.isCompleted) {
          // the first time we get this trigger, it's upon entry of the getAndSubscribe. Now we simply return the value
          c.complete([
            PackageConditionDetails(
                packageName: packageName,
                conditionName: CONDITION_MEMBER_HAS_OPEN_REQUESTS,
                value: value)
          ]);
        } else {
          // subsequent calls we get this trigger, it's when the date has changed. Now add the event to the bloc
          if (value != stateCONDITION_MEMBER_HAS_OPEN_REQUESTS[appId]) {
            stateCONDITION_MEMBER_HAS_OPEN_REQUESTS[appId] = value;
            accessBloc.add(UpdatePackageConditionEvent(
                app, this, CONDITION_MEMBER_HAS_OPEN_REQUESTS, value));
          }
        }
      }, eliudQuery: getOpenFollowRequestsQuery(
          appId, member.documentID!));
      return c.future;
    } else {
      return Future.value([
        PackageConditionDetails(
            packageName: packageName,
            conditionName: CONDITION_MEMBER_HAS_OPEN_REQUESTS,
            value: false)
      ]);
    }
  }

  @override
  List<String> retrieveAllPackageConditions() {
    return [ CONDITION_MEMBER_HAS_OPEN_REQUESTS ];
  }

 @override
  void init() {
    ComponentRegistry().init();

    AbstractRepositorySingleton.singleton = RepositorySingleton();
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() => AbstractRepositorySingleton.collections;
}
