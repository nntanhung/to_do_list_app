import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = SignUpStateInitial;
  const factory SignUpState.loading() = SignUpStateLoading;
  const factory SignUpState.success() = SignUpStateSuccess;
  const factory SignUpState.failded() = SignUpStateFailded;

}
