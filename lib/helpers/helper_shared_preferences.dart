import 'package:shared_preferences/shared_preferences.dart';
 
class HelperSharedPreferences {
  static String valueSharedPreferences = '';
 
// Write DATA
static Future<bool> saveUserData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setInt(valueSharedPreferences, value);
  }
   
// Read Data
static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(valueSharedPreferences);
  }
}