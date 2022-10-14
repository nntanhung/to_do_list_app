import 'dart:core';
import 'package:easy_localization/easy_localization.dart';
import 'package:todo_list/constants.dart';


extension DateTimeExtension on DateTime {

  String toHHmmDate() {
    return DateFormat(DataFormat.ddMMMMy).format(this);
  }
}
