import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../routers/route_keys.dart';
import '../../styles/dimens.dart';
import '../../widgets/widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullNameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final GlobalKey<FormBuilderState> _formKey =
      GlobalKey<FormBuilderState>(debugLabel: 'GlobalFormKey #SignUp ');
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    fullNameFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
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
          fullNameFocusNode: fullNameFocusNode,
          emailFocusNode: emailFocusNode,
          passwordFocusNode: passwordFocusNode,
          confirmPasswordFocusNode: confirmPasswordFocusNode,
          textAccount: tr('have_an_account'),
          textAccount1: tr('sign_in'),
          textButton: 'sign_up'.tr(),
          onTextClick: () {
            AutoRouter.of(context).pop(RouteKey.signIn);
          },
          onTapped: () {
            _onLoginClick();
          },
        ),
      ),
    );
  }

  void _onLoginClick() {
    if (_formKey.currentState!.validate()) {
      AutoRouter.of(context).pushNamed(RouteKey.tickets);
    }
  }
}
