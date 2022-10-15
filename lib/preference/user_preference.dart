import 'base_user_preference.dart';

class UserPreference extends BaseUserPreference {
  static const String _accessTokenKey = 'ACCESS_TOKEN';
  static const String _refreshTokenKey = 'REFRESH_TOKEN';

  Future<String?> get accessToken async => await getLocal(_accessTokenKey);
  Future<String?> get refreshToken async => await getLocal(_refreshTokenKey);
 

  Future setAccessToken(String value) async => setLocal(_accessTokenKey, value);
  Future setRefreshToken(String value) async =>
      setLocal(_refreshTokenKey, value);


  Future<void> setStatic() async {}
}
