import '../models/services/user_auth.dart';
import '../utilities/utility.dart';
import 'base_service.dart';

class AuthenticateService extends BaseService {
  AuthenticateService();

  Future<UserAuth> login({String? email, String? password}) async {
    await Future.delayed(Duration(seconds: 3));

    if (email != "nntanhung@gmail.com" || password != "12345678") {
      throw Exception("username and password does not match");
    } else {
      return Future.value(UserAuth(
          accessToken: MemCache.accessToken,
          refreshToken: MemCache.refreshToken));
    }
  }
}
