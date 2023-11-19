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
import 'package:eliud_core_model/tools/component/component_spec.dart';
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

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  void init() {
    Apis.apis().addInternalComponents('eliud_pkg_follow', [
      "followings",
      "followingDashboards",
      "followRequests",
      "followRequestsDashboards",
      "inviteDashboards",
    ]);

    Apis.apis().register(
        componentName: "eliud_pkg_follow_internalWidgets",
        componentConstructor: ListComponentFactory());
    Apis.apis().addDropDownSupporter(
        "followingDashboards", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "followingDashboards",
        componentConstructor: FollowingDashboardComponentConstructorDefault());
    Apis.apis().addDropDownSupporter(
        "followRequestsDashboards", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "followRequestsDashboards",
        componentConstructor:
            FollowRequestsDashboardComponentConstructorDefault());
    Apis.apis().addDropDownSupporter(
        "inviteDashboards", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "inviteDashboards",
        componentConstructor: InviteDashboardComponentConstructorDefault());
    Apis.apis().addComponentSpec('eliud_pkg_follow', 'follow', [
      ComponentSpec(
          'followingDashboards',
          FollowingDashboardComponentConstructorDefault(),
          FollowingDashboardComponentSelector(),
          FollowingDashboardComponentEditorConstructor(),
          ({String? appId}) => followingDashboardRepository(appId: appId)!),
      ComponentSpec(
          'followRequestsDashboards',
          FollowRequestsDashboardComponentConstructorDefault(),
          FollowRequestsDashboardComponentSelector(),
          FollowRequestsDashboardComponentEditorConstructor(),
          ({String? appId}) =>
              followRequestsDashboardRepository(appId: appId)!),
      ComponentSpec(
          'inviteDashboards',
          InviteDashboardComponentConstructorDefault(),
          InviteDashboardComponentSelector(),
          InviteDashboardComponentEditorConstructor(),
          ({String? appId}) => inviteDashboardRepository(appId: appId)!),
    ]);
    Apis.apis().registerRetrieveRepository('eliud_pkg_follow',
        'followings', ({String? appId}) => followingRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_follow',
        'followingDashboards',
        ({String? appId}) => followingDashboardRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_follow',
        'followRequests',
        ({String? appId}) => followRequestRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_follow',
        'followRequestsDashboards',
        ({String? appId}) => followRequestsDashboardRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_follow',
        'inviteDashboards',
        ({String? appId}) => inviteDashboardRepository(appId: appId)!);
  }
}
