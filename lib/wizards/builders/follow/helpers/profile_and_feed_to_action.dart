import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_etc/model/member_action_model.dart';

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
