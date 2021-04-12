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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:eliud_pkg_follow/model/follow_request_component_bloc.dart';
import 'package:eliud_pkg_follow/model/follow_request_component_event.dart';
import 'package:eliud_pkg_follow/model/follow_request_model.dart';
import 'package:eliud_pkg_follow/model/follow_request_repository.dart';
import 'package:eliud_pkg_follow/model/follow_request_component_state.dart';

abstract class AbstractFollowRequestComponent extends StatelessWidget {
  static String componentName = "followRequests";
  final String? followRequestID;

  AbstractFollowRequestComponent({this.followRequestID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FollowRequestComponentBloc> (
          create: (context) => FollowRequestComponentBloc(
            followRequestRepository: getFollowRequestRepository(context))
        ..add(FetchFollowRequestComponent(id: followRequestID)),
      child: _followRequestBlockBuilder(context),
    );
  }

  Widget _followRequestBlockBuilder(BuildContext context) {
    return BlocBuilder<FollowRequestComponentBloc, FollowRequestComponentState>(builder: (context, state) {
      if (state is FollowRequestComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No FollowRequest defined');
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
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, FollowRequestModel? value);
  Widget alertWidget({ title: String, content: String});
  FollowRequestRepository getFollowRequestRepository(BuildContext context);
}

