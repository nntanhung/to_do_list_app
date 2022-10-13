import 'package:auto_route/auto_route.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/validator/sign_up_validator.dart';

import '../app_dependencies.dart';
import '../constants.dart';
import '../routers/route_keys.dart';
import '../styles/style.dart';
import '../themes/theme.dart';
import 'commons/common.dart';

class BodyAuthen extends StatefulWidget {
  const BodyAuthen({
    Key? key,
    this.emailFocusNode,
    this.fullNameFocusNode,
    this.passwordFocusNode,
    this.confirmPasswordFocusNode,
    this.textButton,
    this.signIn = false,
    this.textAccount,
    this.textAccount1,
    required this.onTextClick,
    this.onTapped,
  }) : super(key: key);

  final FocusNode? fullNameFocusNode;
  final FocusNode? passwordFocusNode;
  final FocusNode? confirmPasswordFocusNode;
  final FocusNode? emailFocusNode;
  final String? textButton;
  final String? textAccount;
  final String? textAccount1;
  final bool signIn;
  final VoidCallback onTextClick;
  final VoidCallback? onTapped;

  @override
  State<BodyAuthen> createState() => _BodyAuthenState();
}

class _BodyAuthenState extends State<BodyAuthen> {
  final _signUpValidator = AppDependencies.injector.get<SignUpValidator>();
  String? _password = '';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return FormBuilder(
      key: widget.key,
      child: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              ImageAssetPath.union,
              height: Dimens.size180,
              width: Dimens.size187,
            ),
          ),
          TextFieldInput(
            name: 'email',
            hintText: 'email'.tr(),
            focusNode: widget.emailFocusNode,
            // controller: widget.emailController,
            refreshAfterBuild: true,
            validateOnFocusChange: true,
            onChanged: (value) {},
            validator: (value) {
              if (widget.emailFocusNode!.hasFocus) {
                return _signUpValidator.validateEmail(value);
              }

              if (StringUtils.isNotNullOrEmpty(value)) {
                return _signUpValidator.validateEmail(value);
              }

              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
          ),
          widget.signIn
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(
                    top: Dimens.size16,
                  ),
                  child: TextFieldInput(
                    name: 'full_name',
                    hintText: 'full_name'.tr(),
                    focusNode: widget.fullNameFocusNode,
                    refreshAfterBuild: true,
                    validateOnFocusChange: true,
                    onChanged: (value) {},
                    validator: (value) {
                      if (widget.fullNameFocusNode!.hasFocus) {
                        return _signUpValidator.validateFullName(value);
                      }
                      if (StringUtils.isNotNullOrEmpty(value)) {
                        return _signUpValidator.validateFullName(value);
                      }

                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
          const SizedBox(
            height: Dimens.size16,
          ),
          TextFieldInput(
            name: 'password',
            hintText: 'password'.tr(),
            focusNode: widget.passwordFocusNode,
            isPassword: true,
            refreshAfterBuild: false,
            validateOnFocusChange: true,
            onChanged: (value) {
              _password = value;
            },
            validator: (value) {
              if (widget.passwordFocusNode!.hasFocus) {
                return _signUpValidator.validatePassword(value);
              }
              if (StringUtils.isNotNullOrEmpty(value)) {
                return _signUpValidator.validatePassword(value);
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: Dimens.size16,
          ),
          widget.signIn
              ? const SizedBox()
              : TextFieldInput(
                  name: 'confirm_password',
                  hintText: 'confirm_password'.tr(),
                  focusNode: widget.confirmPasswordFocusNode,
                  isPassword: true,
                  refreshAfterBuild: false,
                  validateOnFocusChange: true,
                  validator: (value) {
                    if (widget.confirmPasswordFocusNode!.hasFocus) {
                      return _signUpValidator.validateRepeatPassword(
                          value, _password);
                    }
                    if (StringUtils.isNotNullOrEmpty(value)) {
                      return _signUpValidator.validateRepeatPassword(
                          value, _password);
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
          widget.signIn
              ? Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(
                    bottom: Dimens.size16,
                  ),
                  child: TextButton(
                      onPressed: () {
                        AutoRouter.of(context)
                            .pushNamed(RouteKey.forgotPassword);
                      },
                      child: Text(
                        tr('forgot_password'),
                        style: theme.headline6,
                      )),
                )
              : const SizedBox(
                  height: Dimens.size24,
                ),
          SingleButton(
              text: widget.textButton!.toUpperCase(),
              borderRadius: Dimens.size12,
              backgroundColor: AppColors.appColor,
              onTapped: widget.onTapped),
          const SizedBox(
            height: Dimens.size16,
          ),
          RichText(
            text: TextSpan(
              style: theme.headline6,
              children: [
                TextSpan(
                  text: widget.textAccount,
                ),
                TextSpan(
                    text: widget.textAccount1,
                    style: theme.headline6!
                        .copyWith(color: AppColors.primaryLightRed),
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onTextClick),
              ],
            ),
          ),
          const SizedBox(
            height: Dimens.size46,
          ),
        ],
      ),
    );
  }
}
