/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/internal_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/tools/has_fab.dart';


import 'package:eliud_pkg_follow/model/following_list_bloc.dart';
import 'package:eliud_pkg_follow/model/following_list.dart';
import 'package:eliud_pkg_follow/model/following_dropdown_button.dart';
import 'package:eliud_pkg_follow/model/following_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_pkg_follow/model/following_dashboard_list_bloc.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_list.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_dropdown_button.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/repository_export.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_pkg_follow/model/follow_request_list_bloc.dart';
import 'package:eliud_pkg_follow/model/follow_request_list.dart';
import 'package:eliud_pkg_follow/model/follow_request_dropdown_button.dart';
import 'package:eliud_pkg_follow/model/follow_request_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_pkg_follow/model/follow_requests_dashboard_list_bloc.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_list.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_dropdown_button.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/repository_export.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_pkg_follow/model/invite_dashboard_list_bloc.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_list.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_dropdown_button.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/repository_export.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

class ListComponentFactory implements ComponentConstructor {
  Widget? createNew({Key? key, required String appId,  required String id, Map<String, dynamic>? parameters}) {
    return ListComponent(appId: appId, componentId: id);
  }

  @override
  dynamic getModel({required String appId, required String id}) {
    return null;
  }
}


typedef DropdownButtonChanged(String? value);

class DropdownButtonComponentFactory implements ComponentDropDown {
  @override
  dynamic getModel({required String appId, required String id}) {
    return null;
  }


  bool supports(String id) {

    if (id == "followings") return true;
    if (id == "followingDashboards") return true;
    if (id == "followRequests") return true;
    if (id == "followRequestsDashboards") return true;
    if (id == "inviteDashboards") return true;
    return false;
  }

  Widget createNew({Key? key, required String appId, required String id, Map<String, dynamic>? parameters, String? value, DropdownButtonChanged? trigger, bool? optional}) {

    if (id == "followings")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "followingDashboards")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "followRequests")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "followRequestsDashboards")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "inviteDashboards")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    return Text("Id $id not found");
  }
}


class ListComponent extends StatelessWidget with HasFab {
  final String appId;
  final String? componentId;
  Widget? widget;

  @override
  Widget? fab(BuildContext context){
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({required this.appId, this.componentId}) {
    initWidget();
  }

  @override
  Widget build(BuildContext context) {

    if (componentId == 'followings') return _followingBuild(context);
    if (componentId == 'followingDashboards') return _followingDashboardBuild(context);
    if (componentId == 'followRequests') return _followRequestBuild(context);
    if (componentId == 'followRequestsDashboards') return _followRequestsDashboardBuild(context);
    if (componentId == 'inviteDashboards') return _inviteDashboardBuild(context);
    return Text('Component with componentId == $componentId not found');
  }

  void initWidget() {
    if (componentId == 'followings') widget = FollowingListWidget();
    if (componentId == 'followingDashboards') widget = FollowingDashboardListWidget();
    if (componentId == 'followRequests') widget = FollowRequestListWidget();
    if (componentId == 'followRequestsDashboards') widget = FollowRequestsDashboardListWidget();
    if (componentId == 'inviteDashboards') widget = InviteDashboardListWidget();
  }

  Widget _followingBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowingListBloc>(
          create: (context) => FollowingListBloc(
            followingRepository: followingRepository(appId: appId)!,
          )..add(LoadFollowingList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _followingDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowingDashboardListBloc>(
          create: (context) => FollowingDashboardListBloc(
            followingDashboardRepository: followingDashboardRepository(appId: appId)!,
          )..add(LoadFollowingDashboardList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _followRequestBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowRequestListBloc>(
          create: (context) => FollowRequestListBloc(
            followRequestRepository: followRequestRepository(appId: appId)!,
          )..add(LoadFollowRequestList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _followRequestsDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowRequestsDashboardListBloc>(
          create: (context) => FollowRequestsDashboardListBloc(
            followRequestsDashboardRepository: followRequestsDashboardRepository(appId: appId)!,
          )..add(LoadFollowRequestsDashboardList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _inviteDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InviteDashboardListBloc>(
          create: (context) => InviteDashboardListBloc(
            inviteDashboardRepository: inviteDashboardRepository(appId: appId)!,
          )..add(LoadInviteDashboardList()),
        )
      ],
      child: widget!,
    );
  }

}


typedef Changed(String? value);

class DropdownButtonComponent extends StatelessWidget {
  final String appId;
  final String? componentId;
  final String? value;
  final Changed? trigger;
  final bool? optional;

  DropdownButtonComponent({required this.appId, this.componentId, this.value, this.trigger, this.optional});

  @override
  Widget build(BuildContext context) {

    if (componentId == 'followings') return _followingBuild(context);
    if (componentId == 'followingDashboards') return _followingDashboardBuild(context);
    if (componentId == 'followRequests') return _followRequestBuild(context);
    if (componentId == 'followRequestsDashboards') return _followRequestsDashboardBuild(context);
    if (componentId == 'inviteDashboards') return _inviteDashboardBuild(context);
    return Text('Component with componentId == $componentId not found');
  }


  Widget _followingBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowingListBloc>(
          create: (context) => FollowingListBloc(
            followingRepository: followingRepository(appId: appId)!,
          )..add(LoadFollowingList()),
        )
      ],
      child: FollowingDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _followingDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowingDashboardListBloc>(
          create: (context) => FollowingDashboardListBloc(
            followingDashboardRepository: followingDashboardRepository(appId: appId)!,
          )..add(LoadFollowingDashboardList()),
        )
      ],
      child: FollowingDashboardDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _followRequestBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowRequestListBloc>(
          create: (context) => FollowRequestListBloc(
            followRequestRepository: followRequestRepository(appId: appId)!,
          )..add(LoadFollowRequestList()),
        )
      ],
      child: FollowRequestDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _followRequestsDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowRequestsDashboardListBloc>(
          create: (context) => FollowRequestsDashboardListBloc(
            followRequestsDashboardRepository: followRequestsDashboardRepository(appId: appId)!,
          )..add(LoadFollowRequestsDashboardList()),
        )
      ],
      child: FollowRequestsDashboardDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _inviteDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InviteDashboardListBloc>(
          create: (context) => InviteDashboardListBloc(
            inviteDashboardRepository: inviteDashboardRepository(appId: appId)!,
          )..add(LoadInviteDashboardList()),
        )
      ],
      child: InviteDashboardDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

}


