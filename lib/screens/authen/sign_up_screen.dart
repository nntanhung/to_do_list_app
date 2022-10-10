import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/routers/route_keys.dart';

import '../../styles/dimens.dart';
import '../../widgets/widget.dart';

class SignUpScreen extends StatefulWidget {
  final String? predemCode;
  final String? predemType;
  final String? phone;

  SignUpScreen({this.predemType, this.predemCode, this.phone});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size24),
        child: BodyAuthen(
          emailController: _emailController,
          fullNameController: _fullNameController,
          passwordController: _passwordController,
          confirmPasswordController: _confirmPasswordController,
          textAccount: tr('have_an_account'),
          textAccount1: tr('sign_in'),
          textButton: 'sign_up'.tr(),
          onTextClick: () {
            AutoRouter.of(context).pop(RouteKey.signIn);
          },
          onTapped: () {
            AutoRouter.of(context).pushNamed(RouteKey.tickets);
            // _bloc.model.isSubmitting = true;
            // if (_formKey.currentState!.validate()) {
            //   _bloc.add(RequestSignUpEvent());
            // }
          },
        ),
      ),
    );
  }
}
