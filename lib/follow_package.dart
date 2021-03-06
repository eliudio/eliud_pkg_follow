import 'dart:async';
import 'package:eliud_core/model/access_model.dart';

import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/platform/platform.dart';
import 'package:eliud_core/package/package_with_subscription.dart';

import 'model/component_registry.dart';
import 'model/follow_request_model.dart';
import 'package:eliud_pkg_workflow/tools/task/task_model.dart';
import 'model/abstract_repository_singleton.dart';
import 'model/repository_singleton.dart';

abstract class FollowPackage extends PackageWithSubscription {
  static final String CONDITION_MEMBER_HAS_OPEN_REQUESTS = 'Has Open Follow Requests';
  bool stateCONDITION_MEMBER_HAS_OPEN_REQUESTS = null;

  static EliudQuery getOpenFollowRequestsQuery(String appId, String assigneeId) {
    return EliudQuery(
        theConditions: [
          EliudQueryCondition('followedId', isEqualTo: assigneeId),
          EliudQueryCondition('appId', isEqualTo: appId),
          EliudQueryCondition('status', isEqualTo: FollowRequestStatus.FollowRequestPending.index)
        ]
    );
  }

  void _setState(bool newState, {MemberModel currentMember}) {
    if (newState != stateCONDITION_MEMBER_HAS_OPEN_REQUESTS) {
      stateCONDITION_MEMBER_HAS_OPEN_REQUESTS = newState;
      accessBloc.add(MemberUpdated(currentMember));
    }
  }

  void resubscribe(AppModel app, MemberModel currentMember) {
    String appId = app.documentID;
    if (currentMember != null) {
      subscription = followRequestRepository(appId: appId).listen((list) {
        // If we have a different set of assignments, i.e. it has assignments were before it didn't or vice versa,
        // then we must inform the AccessBloc, so that it can refresh the state
        _setState(list.length > 0, currentMember: currentMember);
      }, eliudQuery: getOpenFollowRequestsQuery(
          appId, currentMember.documentID));
    } else {
      _setState(false);
    }
  }

  void unsubscribe() {
    super.unsubscribe();
    _setState(false);
  }


  @override
  Future<bool> isConditionOk(String pluginCondition, AppModel app, MemberModel member, bool isOwner, bool isBlocked, PrivilegeLevel privilegeLevel) async {
    if (pluginCondition == CONDITION_MEMBER_HAS_OPEN_REQUESTS) {
      if (stateCONDITION_MEMBER_HAS_OPEN_REQUESTS == null) return false;
      return stateCONDITION_MEMBER_HAS_OPEN_REQUESTS;
/*
      if (member == null) return false;
      var values = await followRequestRepository(appId: app.documentID).valuesList(eliudQuery: getOpenFollowRequestsQuery(app.documentID, member.documentID));
      return values != null && values.length > 0;
*/
    }
    return null;
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
