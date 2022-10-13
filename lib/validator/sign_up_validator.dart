
import 'package:easy_localization/easy_localization.dart';



class SignUpValidator {

  /// bắt đầu A-Z, a-z, 0-9, 2-15 kí tự kế là A-Z, a-z, 0-9, _, tối đa 15 kí tự.
  bool _isfullnameValid(String fullname) =>
      fullname != '' &&
          RegExp(r'^[A-Za-z0-9][A-Za-z0-9_]{2,15}$').hasMatch(fullname);

  String? validateFullName(String? fullname) {
    if (fullname == null || !_isfullnameValid(fullname)) {
      return 'fullname_validate_error'.tr();
    }

    return null;
  }

  /// có từ 8-64 kí tự.
  bool _isPasswordValid(String password) =>
      password != '' &&
          (RegExp('^([A-Za-z0-9]).{6,32}\$')
              .hasMatch(password) || (RegExp('^(A-Za-z0-9]).{6,32}\$')
              .hasMatch(password) && password.contains(r'\')));

  String? validatePassword(String? password) {
    if (password == null || !_isPasswordValid(password)) {
      return 'password_validate_error'.tr();
    }

    return null;
  }

  String? validateRepeatPassword(String? password, String? repeatPassword) {
    if (password != repeatPassword) {
      return 'repeat_password_validate_error'.tr();
    }

    return null;
  }

  /// *@#.x, không có 2 kí tự đặc biệt liên tiếp nhau
  bool _isValidEmail(String email) =>
      email != '' &&
          RegExp(r"^(?!.*([$&+,:;=?@#|'<>.\-^*()%!]{2,}))(?=(\S+@\S+\.\S+){1,})")
              .hasMatch(email);

  String? validateEmail(String? email) {
    if (email == null || !_isValidEmail(email)) {
      return 'email_validate_error'.tr();
    }

    return null;
  }

}