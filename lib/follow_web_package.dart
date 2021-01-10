import 'follow_package.dart';
import 'model/abstract_repository_singleton.dart';
import 'model/js_repository_singleton.dart';

class FollowWebPackage extends FollowPackage {
  @override
  void init() {
    AbstractRepositorySingleton.singleton = JsRepositorySingleton();
    super.init();
  }
}
