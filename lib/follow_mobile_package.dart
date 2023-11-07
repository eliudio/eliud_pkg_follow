import 'package:eliud_pkg_follow/follow_package.dart';
import 'package:flutter/foundation.dart';

FollowPackage getFollowPackage() => FollowMobilePackage();

class FollowMobilePackage extends FollowPackage {
  @override
  List<Object?> get props => [stateConditionMemberHasOpenRequests];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FollowMobilePackage &&
          runtimeType == other.runtimeType &&
          mapEquals(stateConditionMemberHasOpenRequests,
              other.stateConditionMemberHasOpenRequests);

  @override
  int get hashCode => stateConditionMemberHasOpenRequests.hashCode;
}
