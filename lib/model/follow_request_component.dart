/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_follow/model/follow_request_component_bloc.dart';
import 'package:eliud_pkg_follow/model/follow_request_component_event.dart';
import 'package:eliud_pkg_follow/model/follow_request_model.dart';
import 'package:eliud_pkg_follow/model/follow_request_repository.dart';
import 'package:eliud_pkg_follow/model/follow_request_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractFollowRequestComponent extends StatelessWidget {
  static String componentName = "followRequests";
  final AppModel app;
  final String followRequestId;

  AbstractFollowRequestComponent({Key? key, required this.app, required this.followRequestId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FollowRequestComponentBloc> (
          create: (context) => FollowRequestComponentBloc(
            followRequestRepository: followRequestRepository(appId: app.documentID)!)
        ..add(FetchFollowRequestComponent(id: followRequestId)),
      child: _followRequestBlockBuilder(context),
    );
  }

  Widget _followRequestBlockBuilder(BuildContext context) {
    return BlocBuilder<FollowRequestComponentBloc, FollowRequestComponentState>(builder: (context, state) {
      if (state is FollowRequestComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(app: app, title: "Error", content: 'No FollowRequest defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is FollowRequestComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is FollowRequestComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, FollowRequestModel value);
}

