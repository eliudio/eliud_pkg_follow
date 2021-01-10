/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';


import 'package:eliud_pkg_follow/model/following_dashboard_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum FollowingView {
  Followers, Following, Unknown
}


FollowingView toFollowingView(int index) {
  switch (index) {
    case 0: return FollowingView.Followers;
    case 1: return FollowingView.Following;
  }
  return FollowingView.Unknown;
}


class FollowingDashboardModel {
  String documentID;

  // This is the identifier of the app to which this belongs
  String appId;
  String description;
  FollowingView view;
  ConditionsSimpleModel conditions;

  FollowingDashboardModel({this.documentID, this.appId, this.description, this.view, this.conditions, })  {
    assert(documentID != null);
  }

  FollowingDashboardModel copyWith({String documentID, String appId, String description, FollowingView view, ConditionsSimpleModel conditions, }) {
    return FollowingDashboardModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, view: view ?? this.view, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ view.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is FollowingDashboardModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          view == other.view &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'FollowingDashboardModel{documentID: $documentID, appId: $appId, description: $description, view: $view, conditions: $conditions}';
  }

  FollowingDashboardEntity toEntity({String appId}) {
    return FollowingDashboardEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          view: (view != null) ? view.index : null, 
          conditions: (conditions != null) ? conditions.toEntity(appId: appId) : null, 
    );
  }

  static FollowingDashboardModel fromEntity(String documentID, FollowingDashboardEntity entity) {
    if (entity == null) return null;
    return FollowingDashboardModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          view: toFollowingView(entity.view), 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<FollowingDashboardModel> fromEntityPlus(String documentID, FollowingDashboardEntity entity, { String appId}) async {
    if (entity == null) return null;

    return FollowingDashboardModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          view: toFollowingView(entity.view), 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

