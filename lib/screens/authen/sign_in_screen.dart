import 'package:auto_route/auto_route.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_dependencies.dart';
import '../../blocs/authen/sign_in/sign_in_bloc.dart';
import '../../blocs/authen/sign_in/sign_in_state.dart';
import '../../blocs/base_bloc/base_state.dart';
import '../../constants.dart';
import '../../routers/app_router.dart';
import '../../routers/route_keys.dart';
import '../../styles/dimens.dart';
import '../../themes/app_colors.dart';
import '../../validator/sign_up_validator.dart';
import '../../widgets/base_cubit_stateful_widget.dart';
import '../../widgets/commons/common.dart';

class SignInScreen extends BaseCubitStatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState
    extends BaseCubitStateFulWidgetState<SignInBloc, SignInScreen> {
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final _router = AppDependencies.injector.get<AppRouter>();
  final _signUpValidator = AppDependencies.injector.get<SignUpValidator>();

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
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocListener<SignInBloc, BaseState>(
          listener: (context, BaseState state) {
            if (state is SignInSuccess) {
              if (state.nextPage != null) {
                _router.pushNamed(state.nextPage!);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(tr('login_success'))));
              }
            } else if (state is SignInFail) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(tr('login_fail'))));
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.size24),
            child: FormBuilder(
              key: _formKey,
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
                    name: tr('email'),
                    hintText: tr('email'),
                    focusNode: emailFocusNode,
                    refreshAfterBuild: true,
                    // validateOnFocusChange: true,
                    inputFormatters: [LengthLimitingTextInputFormatter(30)],
                    onChanged: (value) {
                      bloc.users!.email = value;
                    },
                    validator: (value) {
                      if (emailFocusNode.hasFocus) {
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
                  const SizedBox(
                    height: Dimens.size16,
                  ),
                  TextFieldInput(
                    name: tr('password'),
                    hintText: tr('password'),
                    focusNode: passwordFocusNode,
                    isPassword: true,
                    refreshAfterBuild: false,
                    validateOnFocusChange: true,
                    inputFormatters: [LengthLimitingTextInputFormatter(30)],
                    onChanged: (value) {
                      bloc.users!.password = value;
                    },
                    validator: (value) {
                      if (passwordFocusNode.hasFocus) {
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
                  Container(
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
                  ),
                  SingleButton(
                    text: 'sign_in'.tr().toUpperCase(),
                    borderRadius: Dimens.size12,
                    backgroundColor: AppColors.appColor,
                    onTapped: () {
                      if (bloc.users!.email != null &&
                          bloc.users!.password != null &&
                          _formKey.currentState!.validate()) {
                        bloc.login(
                            email: bloc.users!.email,
                            password: bloc.users!.password);
                        // print(
                        //     '---------------------- email ${bloc.users!.email}');
                        // print(
                        //     '---------------------- password ${bloc.users!.password}');
                      } else {
                        print("Not Validated");
                      }
                    },
                  ),
                  const SizedBox(
                    height: Dimens.size16,
                  ),
                  RichText(
                    text: TextSpan(
                      style: theme.headline6,
                      children: [
                        TextSpan(
                          text: tr('dont_have_an_account'),
                        ),
                        TextSpan(
                          text: tr('sign_up'),
                          style: theme.headline6!
                              .copyWith(color: AppColors.primaryLightRed),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              AutoRouter.of(context).pushNamed(RouteKey.signUp);
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.size46,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
