import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_bloc.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_etc/model/member_action_model.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_model.dart';

import '../../model/invite_dashboard_entity.dart';

class InviteDashboardBloc extends ExtEditorBaseBloc<InviteDashboardModel,
    MemberActionModel, InviteDashboardEntity> {
  InviteDashboardBloc(String appId, EditorFeedback feedback)
      : super(appId, inviteDashboardRepository(appId: appId)!, feedback);

  @override
  InviteDashboardModel addItem(
      InviteDashboardModel model, MemberActionModel newItem) {
    List<MemberActionModel> newItems = model.memberActions == null
        ? []
        : model.memberActions!.map((e) => e).toList();
    newItems.add(newItem);
    var newModel = model.copyWith(memberActions: newItems);
    return newModel;
  }

  @override
  InviteDashboardModel deleteItem(
      InviteDashboardModel model, MemberActionModel deleteItem) {
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
  InviteDashboardModel newInstance(StorageConditionsModel conditions) {
    return InviteDashboardModel(
      appId: appId,
      description: 'Invite Dashboard',
      documentID: newRandomKey(),
      conditions: conditions,
    );
  }

  @override
  InviteDashboardModel setDefaultValues(
      InviteDashboardModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }

  @override
  InviteDashboardModel updateItem(InviteDashboardModel model,
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
