import 'package:auto_route/auto_route.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/blocs/authen/sign_in/sign_in_bloc.dart';
import 'package:todo_list/routers/route_keys.dart';
import 'package:todo_list/styles/dimens.dart';

import '../../app_dependencies.dart';
import '../../blocs/authen/sign_in/sign_in_state.dart';
import '../../blocs/base_bloc/base_state.dart';
import '../../constants.dart';
import '../../routers/app_router.dart';
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
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
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

  // @override
  // Widget buildBody(BuildContext context) {
  //   return Scaffold(
  //     body: BlocConsumer(
  //         bloc: bloc,
  //         // create: (context) => bloc,
  //         listener: (context, state) async {
  //           if (state is SignInStateSuccess) {
  //             if (state.nextPage != null) {
  //               _router.pushNamed(state.nextPage!);
  //               AutoRouter.of(context).pushNamed(RouteKey.tickets);
  //               // } else {
  //               //   BaseDialog.show(
  //               //     context,
  //               //     builder: (context) => const ChooseClubPage(),
  //               //   );
  //             }
  //           } else if (state is SignInStateError) {
  //             // ToastUtility.showError([state.errorMessage]);
  //             // if (state.code == ConfigBE.changePassword) {
  //             //   BaseDialog.show(
  //             //     context,
  //             //     builder: (context) => ChangePasswordPage(userName: _userName),
  //             //   );
  //             // }
  //           }
  //         },
  //         builder: (context, SignInState state) {
  //           return state.maybeWhen(
  //             orElse: () => Container(
  //               color: Colors.amber,
  //             ),
  //             success: (nextPage) => Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: Dimens.size24),
  //               child: BodyAuthen(
  //                 key: _formKey,
  //                 emailFocusNode: emailFocusNode,
  //                 passwordFocusNode: passwordFocusNode,
  //                 signIn: true,
  //                 textAccount: tr('dont_have_an_account'),
  //                 textAccount1: tr('sign_up'),
  //                 textButton: 'sign_in'.tr(),
  //                 onTextClick: () {
  //                   AutoRouter.of(context).pushNamed(RouteKey.signUp);
  //                 },
  //                 onTapped: () {
  //                   if (_formKey.currentState!.validate()) {
  //                     bloc.login(
  //                         email: 'nntanhung@gmail.com', password: '12345678');
  //                     // AutoRouter.of(context).pushNamed(RouteKey.tickets);
  //                   }
  //                 },
  //               ),
  //             ),
  //           );
  //         }),
  //     // ),
  //   );
  // }

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      key: _messangerKey,
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocListener<SignInBloc, BaseState>(
          listener: (context, BaseState state) {
            if (state is SignInSuccess) {
              if (state.nextPage != null) {
                _router.pushNamed(state.nextPage!);
                _messangerKey.currentState!
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            } else if (state is SignInFail) {
              _messangerKey.currentState!.showSnackBar(
                  SnackBar(content: Text('trfykygh,gj,h.hjkkn.kj.kj. Data')));
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.size24),
            child:

                // BodyAuthen(
                //   key: _formKey,
                //   emailFocusNode: emailFocusNode,
                //   passwordFocusNode: passwordFocusNode,
                //   signIn: true,
                //   textAccount: tr('dont_have_an_account'),
                //   textAccount1: tr('sign_up'),
                //   textButton: 'sign_in'.tr(),
                //   onTextClick: () {
                //     AutoRouter.of(context).pushNamed(RouteKey.signUp);
                //   },
                //   onTapped: () {
                //     if (_formKey.currentState!.validate()) {
                //       bloc.login(
                //           email: bloc.users!.email, password: bloc.users!.password);
                //       // AutoRouter.of(context).pushNamed(RouteKey.tickets);
                //       //   _bloc.add(RequestSignUpEvent());
                //     }
                //   },
                // ),

              FormBuilder(
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
                    name: 'email',
                    hintText: 'email'.tr(),
                    focusNode: emailFocusNode,
                    refreshAfterBuild: true,
                    validateOnFocusChange: true,
                    inputFormatters: [
                            LengthLimitingTextInputFormatter(30)
                        ],
                    onChanged: (value) {
                      bloc.users!.email = value;
                    },
                    validator: (value) {
                      if (emailFocusNode.hasFocus) {
                        return _signUpValidator.validateEmail(value);
                      }

                      if (bloc.users!.email!.isNotEmpty && StringUtils.isNotNullOrEmpty(value)) {
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
                    name: 'password',
                    hintText: 'password'.tr(),
                    focusNode: passwordFocusNode,
                    isPassword: true,
                    refreshAfterBuild: false,
                    validateOnFocusChange: true,
                    inputFormatters: [
                            LengthLimitingTextInputFormatter(30)
                        ],
                    onChanged: (value) {
                      bloc.users!.password = value;
                    },
                    validator: (value) {
                      if (passwordFocusNode.hasFocus) {
                        return _signUpValidator.validatePassword(value);
                      }
                      if (bloc.users!.password!.isNotEmpty && StringUtils.isNotNullOrEmpty(value)) {
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
                        if (_formKey.currentState!.validate()) {
                          bloc.login(
                              email: bloc.users!.email,
                              password: bloc.users!.password);
                          // AutoRouter.of(context).pushNamed(RouteKey.tickets);
                          print(bloc.users!.email);
                          print(bloc.users!.password);
                        }
                      },),
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
