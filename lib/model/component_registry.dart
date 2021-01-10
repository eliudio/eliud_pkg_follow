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
import 'package:eliud_core/tools/registry.dart';

import '../extensions/following_dashboard_component.dart';
import '../extensions/follow_requests_dashboard_component.dart';
import '../extensions/invite_dashboard_component.dart';
import 'package:eliud_pkg_follow/model/internal_component.dart';




class ComponentRegistry {

  void init() {
    Registry.registry().addInternalComponents('eliud_pkg_follow', ["followings", "followingDashboards", "followRequests", "followRequestsDashboards", "inviteDashboards", ]);

    Registry.registry().register(componentName: "eliud_pkg_follow_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry().addDropDownSupporter("followingDashboards", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "followingDashboards", componentConstructor: FollowingDashboardComponentConstructorDefault());
    Registry.registry().addDropDownSupporter("followRequestsDashboards", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "followRequestsDashboards", componentConstructor: FollowRequestsDashboardComponentConstructorDefault());
    Registry.registry().addDropDownSupporter("inviteDashboards", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "inviteDashboards", componentConstructor: InviteDashboardComponentConstructorDefault());

  }
}


