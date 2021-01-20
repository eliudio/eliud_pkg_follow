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


import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/tools/has_fab.dart';


import 'package:eliud_pkg_follow/model/following_list_bloc.dart';
import 'package:eliud_pkg_follow/model/following_list.dart';
import 'package:eliud_pkg_follow/model/following_dropdown_button.dart';
import 'package:eliud_pkg_follow/model/following_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_membership/model/repository_export.dart';
import 'package:eliud_pkg_membership/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_membership/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_membership/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_pkg_follow/model/following_dashboard_list_bloc.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_list.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_dropdown_button.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_list_event.dart';

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

import 'package:eliud_pkg_follow/model/follow_request_list_bloc.dart';
import 'package:eliud_pkg_follow/model/follow_request_list.dart';
import 'package:eliud_pkg_follow/model/follow_request_dropdown_button.dart';
import 'package:eliud_pkg_follow/model/follow_request_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_membership/model/repository_export.dart';
import 'package:eliud_pkg_membership/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_membership/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_membership/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_pkg_follow/model/follow_requests_dashboard_list_bloc.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_list.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_dropdown_button.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_list_event.dart';

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

import 'package:eliud_pkg_follow/model/invite_dashboard_list_bloc.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_list.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_dropdown_button.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_list_event.dart';

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

class ListComponentFactory implements ComponentConstructor {
  Widget createNew({String id, Map<String, Object> parameters}) {
    return ListComponent(componentId: id);
  }
}


typedef DropdownButtonChanged(String value);

class DropdownButtonComponentFactory implements ComponentDropDown {

  bool supports(String id) {

    if (id == "followings") return true;
    if (id == "followingDashboards") return true;
    if (id == "followRequests") return true;
    if (id == "followRequestsDashboards") return true;
    if (id == "inviteDashboards") return true;
    return false;
  }

  Widget createNew({String id, Map<String, Object> parameters, String value, DropdownButtonChanged trigger, bool optional}) {

    if (id == "followings")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "followingDashboards")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "followRequests")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "followRequestsDashboards")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "inviteDashboards")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    return null;
  }
}


class ListComponent extends StatelessWidget with HasFab {
  final String componentId;
  Widget widget;

  @override
  Widget fab(BuildContext context){
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({this.componentId}) {
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

  Widget initWidget() {
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
            followingRepository: followingRepository(appId: AccessBloc.appId(context)),
          )..add(LoadFollowingList()),
        )
      ],
      child: widget,
    );
  }

  Widget _followingDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowingDashboardListBloc>(
          create: (context) => FollowingDashboardListBloc(
            followingDashboardRepository: followingDashboardRepository(appId: AccessBloc.appId(context)),
          )..add(LoadFollowingDashboardList()),
        )
      ],
      child: widget,
    );
  }

  Widget _followRequestBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowRequestListBloc>(
          create: (context) => FollowRequestListBloc(
            followRequestRepository: followRequestRepository(appId: AccessBloc.appId(context)),
          )..add(LoadFollowRequestList()),
        )
      ],
      child: widget,
    );
  }

  Widget _followRequestsDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowRequestsDashboardListBloc>(
          create: (context) => FollowRequestsDashboardListBloc(
            followRequestsDashboardRepository: followRequestsDashboardRepository(appId: AccessBloc.appId(context)),
          )..add(LoadFollowRequestsDashboardList()),
        )
      ],
      child: widget,
    );
  }

  Widget _inviteDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InviteDashboardListBloc>(
          create: (context) => InviteDashboardListBloc(
            inviteDashboardRepository: inviteDashboardRepository(appId: AccessBloc.appId(context)),
          )..add(LoadInviteDashboardList()),
        )
      ],
      child: widget,
    );
  }

}


typedef Changed(String value);

class DropdownButtonComponent extends StatelessWidget {
  final String componentId;
  final String value;
  final Changed trigger;
  final bool optional;

  DropdownButtonComponent({this.componentId, this.value, this.trigger, this.optional});

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
            followingRepository: followingRepository(appId: AccessBloc.appId(context)),
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
            followingDashboardRepository: followingDashboardRepository(appId: AccessBloc.appId(context)),
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
            followRequestRepository: followRequestRepository(appId: AccessBloc.appId(context)),
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
            followRequestsDashboardRepository: followRequestsDashboardRepository(appId: AccessBloc.appId(context)),
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
            inviteDashboardRepository: inviteDashboardRepository(appId: AccessBloc.appId(context)),
          )..add(LoadInviteDashboardList()),
        )
      ],
      child: InviteDashboardDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

}


