import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo_list/routers/route_keys.dart';
import 'package:todo_list/styles/dimens.dart';

import '../../widgets/widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
final GlobalKey<FormBuilderState> _formKey =
      GlobalKey<FormBuilderState>(debugLabel: 'GlobalFormKey #SignIn ');
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size24),
        child: BodyAuthen(
          key: _formKey,
          emailFocusNode: emailFocusNode,
          passwordFocusNode: passwordFocusNode,
          signIn: true,
          textAccount: tr('dont_have_an_account'),
          textAccount1: tr('sign_up'),
          textButton: 'sign_in'.tr(),
          onTextClick: () {
            AutoRouter.of(context).pushNamed(RouteKey.signUp);
          },
          onTapped: () {
            if (_formKey.currentState!.validate()) {
            AutoRouter.of(context).pushNamed(RouteKey.tickets);
            //   _bloc.add(RequestSignUpEvent());
            }
          },
        ),
      ),
    );
  }
}
