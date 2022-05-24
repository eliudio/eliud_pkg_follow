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

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';

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
  final AppModel app;
  FormAction formAction;
  FollowRequestModel? value;
  ActionModel? submitAction;

  FollowRequestForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<FollowRequestFormBloc >(
            create: (context) => FollowRequestFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseFollowRequestFormEvent(value: value)),
  
        child: MyFollowRequestForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<FollowRequestFormBloc >(
            create: (context) => FollowRequestFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseFollowRequestFormNoLoadEvent(value: value)),
  
        child: MyFollowRequestForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update FollowRequest' : 'Add FollowRequest'),
        body: BlocProvider<FollowRequestFormBloc >(
            create: (context) => FollowRequestFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseFollowRequestFormEvent(value: value) : InitialiseNewFollowRequestFormEvent())),
  
        child: MyFollowRequestForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyFollowRequestForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyFollowRequestForm({required this.app, this.formAction, this.submitAction});

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
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<FollowRequestFormBloc, FollowRequestFormState>(builder: (context, state) {
      if (state is FollowRequestFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
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
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDFollowRequestFormError ? state.message : null, hintText: 'field.remark')
          );

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "memberPublicInfos", value: _follower, trigger: (value, privilegeLevel) => _onFollowerSelected(value), optional: false),
          );

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "memberPublicInfos", value: _followed, trigger: (value, privilegeLevel) => _onFollowedSelected(value), optional: false),
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _statusSelectedRadioTile, 'FollowRequestPending', 'FollowRequestPending', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionStatus(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _statusSelectedRadioTile, 'FollowRequestAccepted', 'FollowRequestAccepted', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionStatus(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _statusSelectedRadioTile, 'FollowRequestDenied', 'FollowRequestDenied', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionStatus(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
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
                ));

        return StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().container(widget.app, context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
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
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



