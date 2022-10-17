// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'sign_in_state.freezed.dart';

// @freezed
// class SignInState with _$SignInState {
//   // const  factory SignInState.initial() = SignInStateInitial;
//   // const factory SignInState.loading() = SignInStateLoading;
//   const factory SignInState.success({String? nextPage}) = SignInStateSuccess;
//   const factory SignInState.error({String? errorMessage}) = SignInStateError;
// }

import '../../base_bloc/base_state.dart';

class SignInSuccess extends BaseState {
  final String? nextPage;

  SignInSuccess({this.nextPage});
  
}

class SignInFail extends BaseState {
  final String errorMessage;
  SignInFail({required this.errorMessage});
  
}
