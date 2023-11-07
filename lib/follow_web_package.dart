import 'package:flutter/foundation.dart';

import 'follow_package.dart';

FollowPackage getFollowPackage() => FollowWebPackage();

class FollowWebPackage extends FollowPackage {
  @override
  List<Object?> get props => [stateConditionMemberHasOpenRequests];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FollowWebPackage &&
          runtimeType == other.runtimeType &&
          mapEquals(stateConditionMemberHasOpenRequests,
              other.stateConditionMemberHasOpenRequests);

  @override
  int get hashCode => stateConditionMemberHasOpenRequests.hashCode;
}
