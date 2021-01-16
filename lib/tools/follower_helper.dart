import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:flutter/cupertino.dart';

class FollowerHelper {
  static String getKey(String followedId, String followerId) {
    return followedId + '-' + followerId;
  }

  static Future<List<String>> following(MemberModel me, String appId) async {
    var query = EliudQuery(theConditions: [
        EliudQueryCondition('followedId', isEqualTo: me.documentID)]);
    var valuesList = await followingRepository(appId: appId).valuesList(eliudQuery: query);
    return valuesList.map((e) => e.documentID);
  }
}
