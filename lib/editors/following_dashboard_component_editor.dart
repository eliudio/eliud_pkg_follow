import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core/core/widgets/helper_widgets/condition_simple_widget.dart';
import 'package:eliud_core/core/widgets/helper_widgets/header_widget.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_helpers/etc/screen_size.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_main/apis/style/frontend/has_divider.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core_main/editor/ext_editor_base_bloc/ext_editor_base_state.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_pkg_etc_model/model/member_action_entity.dart';
import 'package:eliud_pkg_etc_model/model/member_action_model.dart';
import 'package:eliud_pkg_follow/editors/widgets/following_view.dart';
import 'package:eliud_pkg_follow_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow_model/model/following_dashboard_entity.dart';
import 'package:eliud_pkg_follow_model/model/following_dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_pkg_etc/editors/widgets/member_action_model_widget.dart';

import 'bloc/following_dashboard_bloc.dart';

class FollowingDashboardComponentEditorConstructor
    extends ComponentEditorConstructor {
  @override
  void updateComponent(
      AppModel app, BuildContext context, model, EditorFeedback feedback) {
    _openIt(app, context, false, model.copyWith(), feedback);
  }

  @override
  void createNewComponent(
      AppModel app, BuildContext context, EditorFeedback feedback) {
    _openIt(
        app,
        context,
        true,
        FollowingDashboardModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'Following dashboard',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var followingDashboard =
        await followingDashboardRepository(appId: app.documentID)!.get(id);
    if (followingDashboard != null) {
      _openIt(app, context, false, followingDashboard, feedback);
    } else {
      openErrorDialog(app, context, '${app.documentID}/_error',
          title: 'Error',
          errorMessage: 'Cannot find following dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      FollowingDashboardModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      '${app.documentID}/followingdashboard',
      title:
          create ? 'Create Following Dashboard' : 'Update Following Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<FollowingDashboardBloc>(
          create: (context) => FollowingDashboardBloc(
                app.documentID,
                /*create,
            */
                feedback,
              )..add(ExtEditorBaseInitialise<FollowingDashboardModel>(model)),
          child: FollowingDashboardComponentEditor(
            app: app,
          )),
    );
  }

  @override
  Future<FollowingDashboardEntity> revalidateEntity(
      AppModel app, entity) async {
    if (entity != null) {
      var myEntity = entity as FollowingDashboardEntity;
      if (entity.memberActions != null) {
        List<MemberActionEntity> newMemberActions = [];
        for (MemberActionEntity mam in myEntity.memberActions!) {
          if (mam.action != null) {
            newMemberActions.add(mam.copyWith(
                action: mam.action!.copyWith(appId: app.documentID)));
          } else {
            newMemberActions.add(mam);
          }
        }
        var newEntity = myEntity.copyWith(memberActions: newMemberActions);
        return newEntity;
      }
    }
    return entity;
  }
}

class FollowingDashboardComponentEditor extends StatefulWidget {
  final AppModel app;

  const FollowingDashboardComponentEditor({
    super.key,
    required this.app,
  });

  @override
  State<StatefulWidget> createState() =>
      _FollowingDashboardComponentEditorState();
}

class _FollowingDashboardComponentEditorState
    extends State<FollowingDashboardComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<FollowingDashboardBloc,
                ExtEditorBaseState<FollowingDashboardModel>>(
            builder: (ppContext, followingDashboardState) {
          if (followingDashboardState
              is ExtEditorBaseInitialised<FollowingDashboardModel, dynamic>) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'FollowingDashboard',
                    okAction: () async {
                      await BlocProvider.of<FollowingDashboardBloc>(context)
                          .save(ExtEditorBaseApplyChanges<
                                  FollowingDashboardModel>(
                              model: followingDashboardState.model));
                      return true;
                    },
                    cancelAction: () async {
                      return true;
                    },
                  ),
                  topicContainer(widget.app, context,
                      title: 'General',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.vpn_key),
                            title: text(widget.app, context,
                                followingDashboardState.model.documentID)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue:
                                  followingDashboardState.model.description,
                              valueChanged: (value) {
                                followingDashboardState.model.description =
                                    value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                                labelText: 'Description',
                              ),
                            )),
                        FollowingViewWidget(
                          app: widget.app,
                          followingViewCallback: (FollowingView followingView) {
                            followingDashboardState.model.view = followingView;
                          },
                          followingView: followingDashboardState.model.view ??
                              FollowingView.following,
                        ),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Member actions',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _actions(followingDashboardState),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Condition',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.security),
                            title: ConditionsSimpleWidget(
                              app: widget.app,
                              value: followingDashboardState.model.conditions!,
                            )),
                      ]),
                ]);
          } else {
            return progressIndicator(widget.app, context);
          }
        });
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }

  Widget _actions(
      ExtEditorBaseInitialised<FollowingDashboardModel, dynamic> state) {
    List<MemberActionModel> items =
        state.model.memberActions != null ? state.model.memberActions! : [];
    return Container(
      height: 150,
      child: ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
        Container(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                //separatorBuilder: (context, index) => divider(widget.app, context),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final value = items[index];
                  return getListTile(
                    context,
                    widget.app,
                    title: text(widget.app, context,
                        '${value.text ?? '?'} ${value.description ?? '?'}'),
                    trailing: popupMenuButton<int>(widget.app, context,
                        child: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                              popupMenuItem(widget.app, context,
                                  value: 1, label: 'Update'),
                              popupMenuItem(
                                widget.app,
                                context,
                                value: 2,
                                label: 'Delete',
                              ),
                            ],
                        onSelected: (selectedValue) {
                          if (selectedValue == 1) {
                            open(
                                value,
                                (newItem) =>
                                    BlocProvider.of<FollowingDashboardBloc>(
                                            context)
                                        .add(UpdateItemEvent<
                                                FollowingDashboardModel,
                                                MemberActionModel>(
                                            oldItem: value, newItem: newItem)),
                                ((state.model.conditions == null) ||
                                        (state.model.conditions!
                                                .privilegeLevelRequired ==
                                            null))
                                    ? 0
                                    : state.model.conditions!
                                        .privilegeLevelRequired!.index);
                          } else if (selectedValue == 2) {
                            BlocProvider.of<FollowingDashboardBloc>(context)
                                .add(DeleteItemEvent<FollowingDashboardModel,
                                    MemberActionModel>(itemModel: value));
                          }
                        }),
                  );
                })),
        divider(
          widget.app,
          context,
        ),
        Row(children: [
          Spacer(),
          button(
            widget.app,
            context,
            icon: Icon(
              Icons.add,
            ),
            label: 'Add',
            onPressed: () {
              open(
                  MemberActionModel(
                    documentID: newRandomKey(),
                    text: 'new action',
                    description: 'new action',
                    action: null,
                  ),
                  (newItem) => BlocProvider.of<FollowingDashboardBloc>(context)
                      .add(AddItemEvent(itemModel: newItem)),
                  ((state.model.conditions == null) ||
                          (state.model.conditions!.privilegeLevelRequired ==
                              null))
                      ? 0
                      : state.model.conditions!.privilegeLevelRequired!.index);
            },
          ),
          Spacer(),
        ])
      ]),
    );
  }

  void open(
      MemberActionModel value,
      MemberActionModelCallback memberActionModelCallback,
      int privilegeContainer) {
    openFlexibleDialog(
      widget.app,
      context,
      '${widget.app.documentID}/_memberaction',
      includeHeading: false,
      widthFraction: .8,
      child: MemberActionModelWidget.getIt(
          context,
          widget.app,
          false,
          fullScreenWidth(context) * .8,
          fullScreenHeight(context) - 100,
          value,
          memberActionModelCallback,
          privilegeContainer),
    );
  }
}
