import 'package:eliud_core_main/apis/action_api/actions/goto_page.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_pkg_etc_model/model/member_action_model.dart';

class ProfileAndFeedToAction {
  static List<MemberActionModel> getMemberActionModels(
      AppModel app, String feedMenuPageId) {
    List<MemberActionModel> memberActions = [];
    memberActions.add(MemberActionModel(
        documentID: newRandomKey(),
        text: 'Feed',
        description: "Open member feed and profile",
        action: GotoPage(app, pageID: feedMenuPageId)));
    return memberActions;
  }
}
