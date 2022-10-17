import 'package:get_it/get_it.dart';
import 'package:todo_list/utilities/mem_cache.dart';

import '../app_dependencies.dart';
import '../models/services/authenticate.dart';
import '../models/services/user_auth.dart';
import '../utilities/utility.dart';
import 'base_service.dart';

class AuthenticateService extends BaseService {
  AuthenticateService();

  Future<UserAuth> login({String? email, String? password}) async {
    //add some delay to give the feel of api call

    await Future.delayed(Duration(seconds: 3));

    if (email != "nntanhung@gmail.com" || password != "12345678") {
      await preference.setAccessToken(MemCache.accessToken);
      await preference.setRefreshToken(MemCache.accessToken);
      throw Exception("username and password does not match");
      // return null;
    }else {
    await preference.setAccessToken(MemCache.accessToken);
    await preference.setRefreshToken(MemCache.accessToken);
    }

    return Future.value(UserAuth(
        accessToken: MemCache.accessToken,
        refreshToken: MemCache.refreshToken));
  }
}
