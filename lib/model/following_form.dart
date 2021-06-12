/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_form.dart
                       
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

import 'package:eliud_pkg_follow/model/following_list_bloc.dart';
import 'package:eliud_pkg_follow/model/following_list_event.dart';
import 'package:eliud_pkg_follow/model/following_model.dart';
import 'package:eliud_pkg_follow/model/following_form_bloc.dart';
import 'package:eliud_pkg_follow/model/following_form_event.dart';
import 'package:eliud_pkg_follow/model/following_form_state.dart';


class FollowingForm extends StatelessWidget {
  FormAction formAction;
  FollowingModel? value;
  ActionModel? submitAction;

  FollowingForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<FollowingFormBloc >(
            create: (context) => FollowingFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseFollowingFormEvent(value: value)),
  
        child: MyFollowingForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<FollowingFormBloc >(
            create: (context) => FollowingFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseFollowingFormNoLoadEvent(value: value)),
  
        child: MyFollowingForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().constructAppBar(context, formAction == FormAction.UpdateAction ? 'Update Following' : 'Add Following'),
        body: BlocProvider<FollowingFormBloc >(
            create: (context) => FollowingFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseFollowingFormEvent(value: value) : InitialiseNewFollowingFormEvent())),
  
        child: MyFollowingForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyFollowingForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyFollowingForm({this.formAction, this.submitAction});

  _MyFollowingFormState createState() => _MyFollowingFormState(this.formAction);
}


class _MyFollowingFormState extends State<MyFollowingForm> {
  final FormAction? formAction;
  late FollowingFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  String? _follower;
  String? _followed;


  _MyFollowingFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<FollowingFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<FollowingFormBloc, FollowingFormState>(builder: (context, state) {
      if (state is FollowingFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is FollowingFormLoaded) {
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
      }
      if (state is FollowingFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Document ID', Icons.vpn_key, (formAction == FormAction.UpdateAction), _documentIDController, FieldType.String, validator: (_) => state is DocumentIDFollowingFormError ? state.message : null, hintText: 'Member response ID - Member request ID')
          );

        children.add(

                DropdownButtonComponentFactory().createNew(id: "memberPublicInfos", value: _follower, trigger: _onFollowerSelected, optional: false),
          );

        children.add(

                DropdownButtonComponentFactory().createNew(id: "memberPublicInfos", value: _followed, trigger: _onFollowedSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().submitButton(context, 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is FollowingFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<FollowingListBloc>(context).add(
                          UpdateFollowingList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              follower: state.value!.follower, 
                              followed: state.value!.followed, 
                        )));
                      } else {
                        BlocProvider.of<FollowingListBloc>(context).add(
                          AddFollowingList(value: FollowingModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              follower: state.value!.follower, 
                              followed: state.value!.followed, 
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

        return StyleRegistry.registry().styleWithContext(context).adminFormStyle().container(context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedFollowingDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedFollowingAppId(value: _appIdController.text));
  }


  void _onFollowerSelected(String? val) {
    setState(() {
      _follower = val;
    });
    _myFormBloc.add(ChangedFollowingFollower(value: val));
  }


  void _onFollowedSelected(String? val) {
    setState(() {
      _followed = val;
    });
    _myFormBloc.add(ChangedFollowingFollowed(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, FollowingFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



