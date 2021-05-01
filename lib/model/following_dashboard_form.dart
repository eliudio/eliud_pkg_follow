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

import 'package:eliud_pkg_follow/model/following_dashboard_list_bloc.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_list_event.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_form_bloc.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_form_event.dart';
import 'package:eliud_pkg_follow/model/following_dashboard_form_state.dart';


class FollowingDashboardForm extends StatelessWidget {
  FormAction formAction;
  FollowingDashboardModel? value;
  ActionModel? submitAction;

  FollowingDashboardForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<FollowingDashboardFormBloc >(
            create: (context) => FollowingDashboardFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseFollowingDashboardFormEvent(value: value)),
  
        child: MyFollowingDashboardForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<FollowingDashboardFormBloc >(
            create: (context) => FollowingDashboardFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseFollowingDashboardFormNoLoadEvent(value: value)),
  
        child: MyFollowingDashboardForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update FollowingDashboard", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add FollowingDashboard", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
        body: BlocProvider<FollowingDashboardFormBloc >(
            create: (context) => FollowingDashboardFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseFollowingDashboardFormEvent(value: value) : InitialiseNewFollowingDashboardFormEvent())),
  
        child: MyFollowingDashboardForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyFollowingDashboardForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyFollowingDashboardForm({this.formAction, this.submitAction});

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
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<FollowingDashboardFormBloc, FollowingDashboardFormState>(builder: (context, state) {
      if (state is FollowingDashboardFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
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
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: (formAction == FormAction.UpdateAction),
                  controller: _documentIDController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.vpn_key, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Document ID',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DocumentIDFollowingDashboardFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _appIdController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'App Identifier',
                    hintText: "This is the identifier of the app to which this belongs",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is AppIdFollowingDashboardFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Description',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DescriptionFollowingDashboardFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _viewSelectedRadioTile,
                    title: Text("Followers", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Followers", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionView(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _viewSelectedRadioTile,
                    title: Text("Following", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Following", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionView(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Conditions',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));



        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
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
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<FollowingDashboardListBloc>(context).add(
                          AddFollowingDashboardList(value: FollowingDashboardModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              view: state.value!.view, 
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
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: app.formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(accessState, app.formBackground),
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



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, FollowingDashboardFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



