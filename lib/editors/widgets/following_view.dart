import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef FollowingViewCallback = Function(
    FollowingView followingView);

class FollowingViewWidget extends StatefulWidget {
  FollowingViewCallback followingViewCallback;
  final FollowingView followingView;
  final AppModel app;
  FollowingViewWidget(
      {Key? key,
        required this.app,
        required this.followingViewCallback,
        required this.followingView})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FollowingViewWidgetState();
  }
}

class _FollowingViewWidgetState extends State<FollowingViewWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.followingView.index;
  }

  String heighttTypeLandscapeStringValue(FollowingView? followingView) {
    switch (followingView) {
      case FollowingView.Followers:
        return 'Followers';
      case FollowingView.Following:
        return 'Percentage Following';
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
    var stringValue = heighttTypeLandscapeStringValue(followingView);
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
      getPrivilegeOption(FollowingView.Followers),
      getPrivilegeOption(FollowingView.Following)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
