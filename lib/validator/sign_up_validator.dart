
import 'package:easy_localization/easy_localization.dart';

import 'base_validator.dart';


class SignUpValidator extends BaseValidator {

  String? validateFullname(String name) {
    return requiredValidate(name, errorMessage: 'name_error'.tr());
  }

  /// bắt đầu A-Z, a-z, 0-9, 2-15 kí tự kế là A-Z, a-z, 0-9, _, tối đa 15 kí tự.
  bool isUsernameValid(String username) =>
      username != '' &&
          RegExp(r'^[A-Za-z0-9][A-Za-z0-9_]{2,15}$').hasMatch(username);

  String? validateUsername(String? username) {
    if (username == null || !isUsernameValid(username)) {
      return 'user_validate_error'.tr();
    }

    return null;
  }

  /// có 1 kí tự hoa, thường, số, đặc biệt, từ 8-64 kí tự.
  bool isPasswordValid(String password) =>
      password != '' &&
          (RegExp('^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[\!\"\#\$\%\&\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~\']).{8,64}\$')
              .hasMatch(password) || (RegExp('^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,64}\$')
              .hasMatch(password) && password.contains(r'\')));

  String? validatePassword(String? password) {
    if (password == null || !isPasswordValid(password)) {
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

  /// 10 số, bắt đầu với 03, 05, 07, 08 hoặc 09.
  bool _isPhoneValid(String phone) =>
      phone != '' && RegExp(r'^(03|05|07|08|09)\d{8}$').hasMatch(phone);

  String? validatePhone(String? phone) {
    if (phone == null ||!_isPhoneValid(phone)) {
      return 'phone_validate_error'.tr();
    }

    return null;
  }

  /// *@#.x, không có 2 kí tự đặc biệt liên tiếp nhau
  bool _isValidAiaEmail(String email) =>
      email != '' &&
          RegExp(r"^(?!.*([$&+,:;=?@#|'<>.\-^*()%!]{2,}))(?=(\S+@\S+\.\S+){1,})")
              .hasMatch(email);

  String? validateEmail(String? email) {
    if (email == null || !_isValidAiaEmail(email)) {
      return 'email_validate_error'.tr();
    }

    return null;
  }

  String? validateProvince(String? province) {
    if (province == null || province.isEmpty) {
      return 'province_validate_error'.tr();
    }

    return null;
  }
}