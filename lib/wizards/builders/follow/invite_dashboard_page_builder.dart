import 'package:eliud_core/core/wizards/builders/single_component_page_builder.dart';
import 'package:eliud_core/core/wizards/tools/document_identifier.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_component.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'helpers/profile_and_feed_to_action.dart';

class InviteDashboardPageBuilder extends SingleComponentPageBuilder {
  final String feedMenuPageId;

  InviteDashboardPageBuilder(
    this.feedMenuPageId,
    String uniqueId,
    String pageId,
    AppModel app,
    String memberId,
    HomeMenuModel theHomeMenu,
    AppBarModel theAppBar,
    DrawerModel leftDrawer,
    DrawerModel rightDrawer,
  ) : super(
          uniqueId,
          pageId,
          app,
          memberId,
          theHomeMenu,
          theAppBar,
          leftDrawer,
          rightDrawer,
        );

  static InviteDashboardModel _dashboardModel(String feedMenuPageId,
      AppModel app, String uniqueId, String componentIdentifier) {
    return InviteDashboardModel(
      documentID: constructDocumentId(
          uniqueId: uniqueId, documentId: componentIdentifier),
      appId: app.documentID,
      description: "Follow members",
      memberActions:
          ProfileAndFeedToAction.getMemberActionModels(app, feedMenuPageId),
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
    );
  }

  static Future<InviteDashboardModel> setupDashboard(String feedMenuPageId,
      AppModel app, String uniqueId, String componentIdentifier) async {
    return await inviteDashboardRepository(appId: app.documentID)!.add(
        _dashboardModel(feedMenuPageId, app, uniqueId, componentIdentifier));
  }

  Future<PageModel> run({
    required String componentIdentifier,
  }) async {
    await setupDashboard(feedMenuPageId, app, uniqueId, componentIdentifier);
    return await doIt(
        componentName: AbstractInviteDashboardComponent.componentName,
        componentIdentifier: componentIdentifier,
        title: "Find Friends",
        description: "Find Friends");
  }
}
