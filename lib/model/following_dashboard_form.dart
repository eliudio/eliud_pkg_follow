/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_form.dart
                       
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
import 'package:eliud_pkg_etc/model/repository_export.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_pkg_etc/model/embedded_component.dart';
import 'package:eliud_pkg_follow/model/embedded_component.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';

import 'package:eliud_pkg_follow/model/following_dashboard_list_bloc.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_list_event.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_form_bloc.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_form_event.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_form_state.dart';


class FollowingDashboardForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  FollowingDashboardModel? value;
  ActionModel? submitAction;

  FollowingDashboardForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<FollowingDashboardFormBloc >(
            create: (context) => FollowingDashboardFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseFollowingDashboardFormEvent(value: value)),
  
        child: MyFollowingDashboardForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<FollowingDashboardFormBloc >(
            create: (context) => FollowingDashboardFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseFollowingDashboardFormNoLoadEvent(value: value)),
  
        child: MyFollowingDashboardForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update FollowingDashboard' : 'Add FollowingDashboard'),
        body: BlocProvider<FollowingDashboardFormBloc >(
            create: (context) => FollowingDashboardFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseFollowingDashboardFormEvent(value: value) : InitialiseNewFollowingDashboardFormEvent())),
  
        child: MyFollowingDashboardForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyFollowingDashboardForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyFollowingDashboardForm({required this.app, this.formAction, this.submitAction});

  _MyFollowingDashboardFormState createState() => _MyFollowingDashboardFormState(this.formAction);
}


class _MyFollowingDashboardFormState extends State<MyFollowingDashboardForm> {
  final FormAction? formAction;
  late FollowingDashboardFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int? _viewSelectedRadioTile;


  _MyFollowingDashboardFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<FollowingDashboardFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _viewSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<FollowingDashboardFormBloc, FollowingDashboardFormState>(builder: (context, state) {
      if (state is FollowingDashboardFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is FollowingDashboardFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
        if (state.value!.view != null)
          _viewSelectedRadioTile = state.value!.view!.index;
        else
          _viewSelectedRadioTile = 0;
      }
      if (state is FollowingDashboardFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDFollowingDashboardFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'App Identifier', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _appIdController, keyboardType: TextInputType.text, validator: (_) => state is AppIdFollowingDashboardFormError ? state.message : null, hintText: 'field.remark')
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionFollowingDashboardFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _viewSelectedRadioTile, 'Followers', 'Followers', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionView(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _viewSelectedRadioTile, 'Following', 'Following', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionView(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Conditions')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Extra Member Actions')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: memberActionsList(widget.app, context, state.value!.memberActions, _onMemberActionsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Open Profile Action')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is FollowingDashboardFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<FollowingDashboardListBloc>(context).add(
                          UpdateFollowingDashboardList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              view: state.value!.view, 
                              memberActions: state.value!.memberActions, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<FollowingDashboardListBloc>(context).add(
                          AddFollowingDashboardList(value: FollowingDashboardModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              view: state.value!.view, 
                              memberActions: state.value!.memberActions, 
                              conditions: state.value!.conditions, 
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
    _myFormBloc.add(ChangedFollowingDashboardDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedFollowingDashboardAppId(value: _appIdController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedFollowingDashboardDescription(value: _descriptionController.text));
  }


  void setSelectionView(int? val) {
    setState(() {
      _viewSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedFollowingDashboardView(value: toFollowingView(val)));
  }


  void _onMemberActionsChanged(value) {
    _myFormBloc.add(ChangedFollowingDashboardMemberActions(value: value));
    setState(() {});
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, FollowingDashboardFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



