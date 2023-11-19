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

import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';

import 'package:eliud_core/model/internal_component.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';

import 'package:eliud_pkg_follow/model/following_list_bloc.dart';
import 'package:eliud_pkg_follow/model/following_list_event.dart';
import 'package:eliud_pkg_follow/model/following_model.dart';
import 'package:eliud_pkg_follow/model/following_form_bloc.dart';
import 'package:eliud_pkg_follow/model/following_form_event.dart';
import 'package:eliud_pkg_follow/model/following_form_state.dart';

class FollowingForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final FollowingModel? value;
  final ActionModel? submitAction;

  FollowingForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the FollowingForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<FollowingFormBloc>(
        create: (context) => FollowingFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseFollowingFormEvent(value: value)),
        child: _MyFollowingForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<FollowingFormBloc>(
        create: (context) => FollowingFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseFollowingFormNoLoadEvent(value: value)),
        child: _MyFollowingForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Following'
                      : 'Add Following'),
          body: BlocProvider<FollowingFormBloc>(
            create: (context) => FollowingFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseFollowingFormEvent(value: value)
                : InitialiseNewFollowingFormEvent())),
            child: _MyFollowingForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyFollowingForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyFollowingForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyFollowingForm> createState() => _MyFollowingFormState(formAction);
}

class _MyFollowingFormState extends State<_MyFollowingForm> {
  final FormAction? formAction;
  late FollowingFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  String? _follower;
  String? _followed;

  _MyFollowingFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<FollowingFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<FollowingFormBloc, FollowingFormState>(
        builder: (context, state) {
      if (state is FollowingFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is FollowingFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        if (state.value!.follower != null) {
          _follower = state.value!.follower!.documentID;
        } else {
          _follower = "";
        }
        if (state.value!.followed != null) {
          _followed = state.value!.followed!.documentID;
        } else {
          _followed = "";
        }
      }
      if (state is FollowingFormInitialized) {
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
                validator: (_) => state is DocumentIDFollowingFormError
                    ? state.message
                    : null,
                hintText: 'field.remark'));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "memberPublicInfos",
              value: _follower,
              trigger: (value, privilegeLevel) => _onFollowerSelected(value),
              optional: false),
        );

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "memberPublicInfos",
              value: _followed,
              trigger: (value, privilegeLevel) => _onFollowedSelected(value),
              optional: false),
        );

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
                        if (state is FollowingFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<FollowingListBloc>(context)
                                .add(UpdateFollowingList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              follower: state.value!.follower,
                              followed: state.value!.followed,
                            )));
                          } else {
                            BlocProvider.of<FollowingListBloc>(context)
                                .add(AddFollowingList(
                                    value: FollowingModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              follower: state.value!.follower,
                              followed: state.value!.followed,
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
    _myFormBloc
        .add(ChangedFollowingDocumentID(value: _documentIDController.text));
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
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, FollowingFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
