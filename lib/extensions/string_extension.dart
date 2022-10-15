import 'package:easy_localization/easy_localization.dart';

class ConvertUtility {
      static String? convertDateTimeToString({required DateTime? dateTime, required DateFormat format}){
    if (dateTime == null) {
      return null;
    } else {
      return format.format(dateTime);
    }
  }

}