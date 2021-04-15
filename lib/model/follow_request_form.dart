/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_pkg_follow/model/embedded_component.dart';
import 'package:eliud_pkg_follow/tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_pkg_follow/model/embedded_component.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_pkg_follow/model/follow_request_list_bloc.dart';
import 'package:eliud_pkg_follow/model/follow_request_list_event.dart';
import 'package:eliud_pkg_follow/model/follow_request_model.dart';
import 'package:eliud_pkg_follow/model/follow_request_form_bloc.dart';
import 'package:eliud_pkg_follow/model/follow_request_form_event.dart';
import 'package:eliud_pkg_follow/model/follow_request_form_state.dart';


class FollowRequestForm extends StatelessWidget {
  FormAction formAction;
  FollowRequestModel? value;
  ActionModel? submitAction;

  FollowRequestForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (formAction == FormAction.ShowData) {
      return BlocProvider<FollowRequestFormBloc >(
            create: (context) => FollowRequestFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseFollowRequestFormEvent(value: value)),
  
        child: MyFollowRequestForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<FollowRequestFormBloc >(
            create: (context) => FollowRequestFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseFollowRequestFormNoLoadEvent(value: value)),
  
        child: MyFollowRequestForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update FollowRequest", style: TextStyle(color: RgbHelper.color(rgbo: app!.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app!.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add FollowRequest", style: TextStyle(color: RgbHelper.color(rgbo: app!.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app!.formAppBarBackground)),
                ),
        body: BlocProvider<FollowRequestFormBloc >(
            create: (context) => FollowRequestFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseFollowRequestFormEvent(value: value) : InitialiseNewFollowRequestFormEvent())),
  
        child: MyFollowRequestForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyFollowRequestForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyFollowRequestForm({this.formAction, this.submitAction});

  _MyFollowRequestFormState createState() => _MyFollowRequestFormState(this.formAction);
}


class _MyFollowRequestFormState extends State<MyFollowRequestForm> {
  final FormAction? formAction;
  late FollowRequestFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  String? _follower;
  String? _followed;
  int? _statusSelectedRadioTile;


  _MyFollowRequestFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<FollowRequestFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _statusSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<FollowRequestFormBloc, FollowRequestFormState>(builder: (context, state) {
      if (state is FollowRequestFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is FollowRequestFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.follower != null)
          _follower= state.value!.follower!.documentID;
        else
          _follower= "";
        if (state.value!.followed != null)
          _followed= state.value!.followed!.documentID;
        else
          _followed= "";
        if (state.value!.status != null)
          _statusSelectedRadioTile = state.value!.status!.index;
        else
          _statusSelectedRadioTile = 0;
      }
      if (state is FollowRequestFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app!.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor)),
                  readOnly: (formAction == FormAction.UpdateAction),
                  controller: _documentIDController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldFocusColor))),                    icon: Icon(Icons.vpn_key, color: RgbHelper.color(rgbo: app!.formFieldHeaderColor)),
                    labelText: 'Document ID',
                    hintText: "Member request ID - Member response ID",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DocumentIDFollowRequestFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                DropdownButtonComponentFactory().createNew(id: "memberPublicInfos", value: _follower, trigger: _onFollowerSelected, optional: false),
          );

        children.add(

                DropdownButtonComponentFactory().createNew(id: "memberPublicInfos", value: _followed, trigger: _onFollowedSelected, optional: false),
          );

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app!.formFieldTextColor),
                    groupValue: _statusSelectedRadioTile,
                    title: Text("FollowRequestPending", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    subtitle: Text("FollowRequestPending", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionStatus(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app!.formFieldTextColor),
                    groupValue: _statusSelectedRadioTile,
                    title: Text("FollowRequestAccepted", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    subtitle: Text("FollowRequestAccepted", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionStatus(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: app!.formFieldTextColor),
                    groupValue: _statusSelectedRadioTile,
                    title: Text("FollowRequestDenied", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    subtitle: Text("FollowRequestDenied", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionStatus(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app!.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app!.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is FollowRequestFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<FollowRequestListBloc>(context).add(
                          UpdateFollowRequestList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              follower: state.value!.follower, 
                              followed: state.value!.followed, 
                              status: state.value!.status, 
                        )));
                      } else {
                        BlocProvider.of<FollowRequestListBloc>(context).add(
                          AddFollowRequestList(value: FollowRequestModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              follower: state.value!.follower, 
                              followed: state.value!.followed, 
                              status: state.value!.status, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: app!.formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(accessState, app!.formBackground),
          padding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          )
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedFollowRequestDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedFollowRequestAppId(value: _appIdController.text));
  }


  void _onFollowerSelected(String? val) {
    setState(() {
      _follower = val;
    });
    _myFormBloc.add(ChangedFollowRequestFollower(value: val));
  }


  void _onFollowedSelected(String? val) {
    setState(() {
      _followed = val;
    });
    _myFormBloc.add(ChangedFollowRequestFollowed(value: val));
  }


  void setSelectionStatus(int? val) {
    setState(() {
      _statusSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedFollowRequestStatus(value: toFollowRequestStatus(val)));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, FollowRequestFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



