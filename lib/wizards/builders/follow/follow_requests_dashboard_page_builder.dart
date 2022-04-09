import 'package:eliud_core/core/wizards/builders/single_component_page_builder.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core/wizards/tools/documentIdentifier.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/follow_requests_dashboard_component.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';

import 'helpers/profile_and_feed_to_action.dart';

class FollowRequestsDashboardPageBuilder extends SingleComponentPageBuilder {
  final String feedMenuPageId;

  FollowRequestsDashboardPageBuilder(
      this.feedMenuPageId,
      String uniqueId,
      String pageId,
      AppModel app,
      String memberId,
      HomeMenuModel theHomeMenu,
      AppBarModel theAppBar,
      DrawerModel leftDrawer,
      DrawerModel rightDrawer,
      )
      : super(uniqueId, pageId, app, memberId, theHomeMenu, theAppBar,
            leftDrawer, rightDrawer, );

  static FollowRequestsDashboardModel _dashboardModel(String feedMenuPageId, AppModel app, String uniqueId, String componentIdentifier) {
    return FollowRequestsDashboardModel(
      documentID: constructDocumentId(uniqueId: uniqueId, documentId: componentIdentifier),
      appId: app.documentID!,
      description: "Follow requests",
      memberActions: ProfileAndFeedToAction.getMemberActionModels(app, feedMenuPageId),
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
          PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  static Future<FollowRequestsDashboardModel> setupDashboard(String feedMenuPageId, AppModel app, String uniqueId, String componentIdentifier) async {
    return await followRequestsDashboardRepository(appId: app.documentID!)!
        .add(_dashboardModel(feedMenuPageId, app, uniqueId, componentIdentifier));
  }

  Future<PageModel> run(
      {required String componentIdentifier,
      }) async {
    await setupDashboard(feedMenuPageId, app, uniqueId, componentIdentifier);
    return await doIt(
        componentName: AbstractFollowRequestsDashboardComponent.componentName,
        componentIdentifier: componentIdentifier,
        title: "Follower requests");
  }
}
