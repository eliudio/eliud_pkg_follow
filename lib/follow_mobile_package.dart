import 'package:eliud_pkg_follow/follow_package.dart';

import 'model/component_registry.dart';

class FollowMobilePackage extends FollowPackage {

  @override
  List<Object?> get props => [
    stateCONDITION_MEMBER_HAS_OPEN_REQUESTS
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is FollowMobilePackage &&
              runtimeType == other.runtimeType &&
              stateCONDITION_MEMBER_HAS_OPEN_REQUESTS == other.stateCONDITION_MEMBER_HAS_OPEN_REQUESTS;
}
