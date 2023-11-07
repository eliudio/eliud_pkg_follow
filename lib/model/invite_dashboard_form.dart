/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_pkg_etc/model/embedded_component.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';

import 'package:eliud_pkg_follow/model/invite_dashboard_list_bloc.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_list_event.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_model.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_form_bloc.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_form_event.dart';
import 'package:eliud_pkg_follow/model/invite_dashboard_form_state.dart';

class InviteDashboardForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final InviteDashboardModel? value;
  final ActionModel? submitAction;

  InviteDashboardForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the InviteDashboardForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<InviteDashboardFormBloc>(
        create: (context) => InviteDashboardFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseInviteDashboardFormEvent(value: value)),
        child: MyInviteDashboardForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<InviteDashboardFormBloc>(
        create: (context) => InviteDashboardFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseInviteDashboardFormNoLoadEvent(value: value)),
        child: MyInviteDashboardForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update InviteDashboard'
                      : 'Add InviteDashboard'),
          body: BlocProvider<InviteDashboardFormBloc>(
            create: (context) => InviteDashboardFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseInviteDashboardFormEvent(value: value)
                : InitialiseNewInviteDashboardFormEvent())),
            child: MyInviteDashboardForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class MyInviteDashboardForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyInviteDashboardForm(
      {required this.app, this.formAction, this.submitAction});

  @override
  State<MyInviteDashboardForm> createState() =>
      _MyInviteDashboardFormState(formAction);
}

class _MyInviteDashboardFormState extends State<MyInviteDashboardForm> {
  final FormAction? formAction;
  late InviteDashboardFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  _MyInviteDashboardFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<InviteDashboardFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<InviteDashboardFormBloc, InviteDashboardFormState>(
        builder: (context, state) {
      if (state is InviteDashboardFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is InviteDashboardFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _appIdController.text = state.value!.appId.toString();
        _descriptionController.text = state.value!.description.toString();
      }
      if (state is InviteDashboardFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DocumentIDInviteDashboardFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'App Identifier',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _appIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is AppIdInviteDashboardFormError
                    ? state.message
                    : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Description',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DescriptionInviteDashboardFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Conditions')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Extra Member Actions')));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: memberActionsList(widget.app, context,
                state.value!.memberActions, _onMemberActionsChanged)));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Open Profile Action')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(accessState, state)
                    ? null
                    : () {
                        if (state is InviteDashboardFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<InviteDashboardListBloc>(context)
                                .add(UpdateInviteDashboardList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              memberActions: state.value!.memberActions,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<InviteDashboardListBloc>(context)
                                .add(AddInviteDashboardList(
                                    value: InviteDashboardModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              memberActions: state.value!.memberActions,
                              conditions: state.value!.conditions,
                            )));
                          }
                          if (widget.submitAction != null) {
                            eliudrouter.Router.navigateTo(
                                context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(
        ChangedInviteDashboardDocumentID(value: _documentIDController.text));
  }

  void _onAppIdChanged() {
    _myFormBloc.add(ChangedInviteDashboardAppId(value: _appIdController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(
        ChangedInviteDashboardDescription(value: _descriptionController.text));
  }

  void _onMemberActionsChanged(value) {
    _myFormBloc.add(ChangedInviteDashboardMemberActions(value: value));
    setState(() {});
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(
      AccessState accessState, InviteDashboardFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
