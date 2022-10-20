import 'dart:core';
import 'package:easy_localization/easy_localization.dart';
import 'package:todo_list/constants.dart';


extension DateTimeExtension on DateTime {

  String toddMMMMyDate() {
    return DateFormat(DataFormat.ddMMMMy).format(this);
  }
  String toyyyyMMddDate() {
    return DateFormat(DataFormat.yyyyMMdd).format(this);
  }
}
