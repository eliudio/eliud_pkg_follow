/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import '../model/internal_component.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'abstract_repository_singleton.dart';

import '../extensions/following_dashboard_component.dart';
import '../editors/following_dashboard_component_editor.dart';
import 'following_dashboard_component_selector.dart';
import '../extensions/follow_requests_dashboard_component.dart';
import '../editors/follow_requests_dashboard_component_editor.dart';
import 'follow_requests_dashboard_component_selector.dart';
import '../extensions/invite_dashboard_component.dart';
import '../editors/invite_dashboard_component_editor.dart';
import 'invite_dashboard_component_selector.dart';
import 'package:eliud_pkg_follow/model/internal_component.dart';




class ComponentRegistry {

  void init() {
    Registry.registry()!.addInternalComponents('eliud_pkg_follow', ["followings", "followingDashboards", "followRequests", "followRequestsDashboards", "inviteDashboards", ]);

    Registry.registry()!.register(componentName: "eliud_pkg_follow_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry()!.addDropDownSupporter("followingDashboards", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "followingDashboards", componentConstructor: FollowingDashboardComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("followRequestsDashboards", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "followRequestsDashboards", componentConstructor: FollowRequestsDashboardComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("inviteDashboards", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "inviteDashboards", componentConstructor: InviteDashboardComponentConstructorDefault());
    Registry.registry()!.addComponentSpec('eliud_pkg_follow', 'follow', [
      ComponentSpec('followingDashboards', FollowingDashboardComponentConstructorDefault(), FollowingDashboardComponentSelector(), FollowingDashboardComponentEditorConstructor(), ({String? appId}) => followingDashboardRepository(appId: appId)! ), 
      ComponentSpec('followRequestsDashboards', FollowRequestsDashboardComponentConstructorDefault(), FollowRequestsDashboardComponentSelector(), FollowRequestsDashboardComponentEditorConstructor(), ({String? appId}) => followRequestsDashboardRepository(appId: appId)! ), 
      ComponentSpec('inviteDashboards', InviteDashboardComponentConstructorDefault(), InviteDashboardComponentSelector(), InviteDashboardComponentEditorConstructor(), ({String? appId}) => inviteDashboardRepository(appId: appId)! ), 
    ]);

  }
}


