/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_pkg_follow/model/following_component_bloc.dart';
import 'package:eliud_pkg_follow/model/following_component_event.dart';
import 'package:eliud_pkg_follow/model/following_model.dart';
import 'package:eliud_pkg_follow/model/following_repository.dart';
import 'package:eliud_pkg_follow/model/following_component_state.dart';

abstract class AbstractFollowingComponent extends StatelessWidget {
  static String componentName = "followings";
  final String? followingID;

  AbstractFollowingComponent({Key? key, this.followingID}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FollowingComponentBloc> (
          create: (context) => FollowingComponentBloc(
            followingRepository: getFollowingRepository(context))
        ..add(FetchFollowingComponent(id: followingID)),
      child: _followingBlockBuilder(context),
    );
  }

  Widget _followingBlockBuilder(BuildContext context) {
    return BlocBuilder<FollowingComponentBloc, FollowingComponentState>(builder: (context, state) {
      if (state is FollowingComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No Following defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is FollowingComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is FollowingComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, FollowingModel? value);
  Widget alertWidget({ title: String, content: String});
  FollowingRepository getFollowingRepository(BuildContext context);
}

