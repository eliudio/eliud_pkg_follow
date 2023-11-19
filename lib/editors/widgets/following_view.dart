import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/style/frontend/has_list_tile.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef FollowingViewCallback = Function(FollowingView followingView);

class FollowingViewWidget extends StatefulWidget {
  final FollowingViewCallback followingViewCallback;
  final FollowingView followingView;
  final AppModel app;
  FollowingViewWidget(
      {super.key,
      required this.app,
      required this.followingViewCallback,
      required this.followingView});

  @override
  State<StatefulWidget> createState() {
    return _FollowingViewWidgetState();
  }
}

class _FollowingViewWidgetState extends State<FollowingViewWidget> {
  int? _heightTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.followingView.index;
  }

  String heightTypeLandscapeStringValue(FollowingView? followingView) {
    switch (followingView) {
      case FollowingView.followers:
        return 'Followers';
      case FollowingView.following:
        return 'Percentage Following';
      case FollowingView.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.followingViewCallback(toFollowingView(val));
    });
  }

  Widget getPrivilegeOption(FollowingView? followingView) {
    if (followingView == null) return Text("?");
    var stringValue = heightTypeLandscapeStringValue(followingView);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            followingView.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
            (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(FollowingView.followers),
      getPrivilegeOption(FollowingView.following)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
