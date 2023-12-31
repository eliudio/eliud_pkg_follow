import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_main/editor/ext_editor_base_bloc/ext_editor_base_bloc.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_pkg_etc_model/model/member_action_model.dart';
import 'package:eliud_pkg_follow_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow_model/model/following_dashboard_entity.dart';
import 'package:eliud_pkg_follow_model/model/following_dashboard_model.dart';

class FollowingDashboardBloc extends ExtEditorBaseBloc<FollowingDashboardModel,
    MemberActionModel, FollowingDashboardEntity> {
  FollowingDashboardBloc(String appId, EditorFeedback feedback)
      : super(appId, followingDashboardRepository(appId: appId)!, feedback);

  @override
  FollowingDashboardModel addItem(
      FollowingDashboardModel model, MemberActionModel newItem) {
    List<MemberActionModel> newItems = model.memberActions == null
        ? []
        : model.memberActions!.map((e) => e).toList();
    newItems.add(newItem);
    var newModel = model.copyWith(memberActions: newItems);
    return newModel;
  }

  @override
  FollowingDashboardModel deleteItem(
      FollowingDashboardModel model, MemberActionModel deleteItem) {
    var newItems = <MemberActionModel>[];
    for (var item in model.memberActions!) {
      if (item != deleteItem) {
        newItems.add(item);
      }
    }
    var newModel = model.copyWith(memberActions: newItems);
    return newModel;
  }

  @override
  FollowingDashboardModel newInstance(StorageConditionsModel conditions) {
    return FollowingDashboardModel(
      appId: appId,
      documentID: newRandomKey(),
      description: 'Following dashboard',
      conditions: conditions,
    );
  }

  @override
  FollowingDashboardModel setDefaultValues(
      FollowingDashboardModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }

  @override
  FollowingDashboardModel updateItem(FollowingDashboardModel model,
      MemberActionModel oldItem, MemberActionModel newItem) {
    List<MemberActionModel> currentItems =
        model.memberActions == null ? [] : model.memberActions!;
    var index = currentItems.indexOf(oldItem);
    if (index != -1) {
      var newItems = currentItems.map((e) => e).toList();
      newItems[index] = newItem;
      var newModel = model.copyWith(memberActions: newItems);
      return newModel;
    } else {
      throw Exception("Could not find $oldItem");
    }
  }

  @override
  List<MemberActionModel> copyOf(List<MemberActionModel> ts) {
    return ts.map((e) => e).toList();
  }
}
