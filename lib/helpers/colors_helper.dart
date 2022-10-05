
import 'package:easy_localization/easy_localization.dart';

import '../routers/route_keys.dart';

class Helper {
  static String mapType(String type) {
    switch (type) {
      case RouteKey.signIn:
        return tr('sign_in');
      case RouteKey.signUp:
        return tr('sign_up');
      default:
        return tr('forgot_password');
    }
  }

    static const mappingDayOfWeek = {
    'mon': 'M',
    'tue': 'T',
    'wed': 'W',
    'thu': 'T',
    'fri': 'F',
    'sat': 'S',
    'sun': 'S',
    'th2': 'T2',
    'th3': 'T3',
    'th4': 'T4',
    'th5': 'T5',
    'th6': 'T6',
    'th7': 'T7',
    'cn': 'CN',
  };

  static const mapDayToVN = {
    'Monday': 'Thứ 2',
    'Tuesday': 'Thứ 3',
    'Wednesday': 'Thứ 4',
    'Thursday': 'Thứ 5',
    'Friday': 'Thứ 6',
    'Saturday': 'Thứ 7',
    'Sunday': 'Chủ nhật',
  };
}