import 'package:easy_localization/easy_localization.dart';

class Constants {
  static const String emptyString = '';
  static const String processing = 'Processing';
  static const String success = 'Success';
  static const String draft = 'Draft';
  static const String cancelled = 'Cancelled';
  static const String needAdditional = 'Need Additional';

  static const double iconSize = 24.0;
}

class ImageAssetPath {
  ImageAssetPath._();

  /// Images folder
  static const String bookOpenIcon = 'assets/images/book-open_ic.svg';
  static const String calendarIcon = 'assets/images/calendar_ic.svg';
  static const String checkSquareIcon = 'assets/images/check_square_ic.svg';
  static const String chevronLeftIcon = 'assets/images/chevron_left_ic.svg';
  static const String chevronRightIcon = 'assets/images/chevron_right_ic.svg';
  static const String clockIcon = 'assets/images/clock_ic.svg';
  static const String clockSmallIcon = 'assets/images/clock_small_ic.svg';
  static const String editIcon = 'assets/images/edit_ic.svg';
  static const String eyeOffIcon = 'assets\images\eye_off_ic.svg';
  static const String filterIcon = 'assets/images/filter_ic.svg';
  static const String logOutIcon = 'assets/images/log_out_ic.svg';
  static const String menuIcon = 'assets/images/menu_ic.svg';
  static const String messageQuareIcon = 'assets/images/message_quare_ic.svg';
  static const String plusCircleIcon = 'assets/images/plus_circle_ic.svg';
  static const String plusSquareIcon = 'assets/images/plus_square_ic.svg';
  static const String rafiki = 'assets/images/rafiki.svg';
  static const String searchIcon = 'assets/images/search_ic.svg';
  static const String setting = 'assets/images/setting.svg';
  static const String todolist = 'assets/images/todo_list.svg';
  static const String union = 'assets/images/union.svg';
  static const String starIcon = 'assets/images/star_ic.svg';
  static const String starSmallIcon = 'assets/images/star_small_ic.svg';
  static const String trashIcon = 'assets/images/trash_ic.svg';

  /// SVG folder
  static const String sendEmail = 'assets/svg/send_email.svg';
}
class DataFormat {
  static final DateFormat ddMMyyyy = DateFormat('dd/MM/yyyy');
  static final DateFormat hhmmddMMyyyy = DateFormat('HH:mm - dd/MM/yyyy');
  static final DateFormat hhMM = DateFormat('HH:mm');
  static final DateFormat hhMMSS = DateFormat('HH:mm:ss');
}