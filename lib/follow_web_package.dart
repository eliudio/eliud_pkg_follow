import 'package:flutter/foundation.dart';

import 'follow_package.dart';
import 'model/abstract_repository_singleton.dart';

FollowPackage getFollowPackage() => FollowWebPackage();

class FollowWebPackage extends FollowPackage {

  @override
  List<Object?> get props => [
    stateCONDITION_MEMBER_HAS_OPEN_REQUESTS
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is FollowWebPackage &&
              runtimeType == other.runtimeType &&
              mapEquals(stateCONDITION_MEMBER_HAS_OPEN_REQUESTS, other.stateCONDITION_MEMBER_HAS_OPEN_REQUESTS);
}
