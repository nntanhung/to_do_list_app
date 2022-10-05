import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/routers/route_keys.dart';
import 'package:todo_list/styles/dimens.dart';

import '../../widgets/widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size24),
        child: BodyAuthen(
          emailController: _emailController,
          passwordController: _passwordController,
          signIn: true,
          textAccount: tr('dont_have_an_account'),
          textAccount1: tr('sign_up'),
          textButton: 'sign_in'.tr(),
          onTextClick: () {
            AutoRouter.of(context).pushNamed(RouteKey.signUp);
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
