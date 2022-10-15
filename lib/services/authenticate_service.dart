import 'package:get_it/get_it.dart';
import 'package:todo_list/utilities/mem_cache.dart';

import '../app_dependencies.dart';
import '../models/services/authenticate.dart';
import '../models/services/user_auth.dart';
import '../utilities/network/data_result.dart';
import '../utilities/network/network.dart';
import '../utilities/utility.dart';
import 'base_service.dart';

class AuthenticateService extends BaseService {
  AuthenticateService();
  // final _rest = AppDependencies.injector.get<RestUtils>(instanceName: 'MAIN');
  //    static GetIt get injector => GetIt.I;
  //   var config = injector.get<AppConfiguration>();

  // Future<int> basicLogin({
  //   required String email,
  //   required String password,
  // }) async {
  //   await preference.setAccessToken(config.accessToken);
  //     await preference.setRefreshToken(config.accessToken);
  //   // final request = AuthenticateRequest()
  //   //   ..username = email
  //   //   ..password = password;
  //   // var response = await _rest.request<AuthenticateResponse>(
  //   //     Method.post, '/api/v1/auth/authenticate',
  //   //     data: request.toJson());
  //   // if (email.isNotEmpty && password.isNotEmpty) {
  //     return 1;
  //   // }
  //   // return processLoginResponse(response);
  // }

  // Future<int> processLoginResponse(
  //     DataResult<DataResponse<AuthenticateResponse>> result) async {
  //   if (result.isSuccess) {
  //     final response = result.data!.dataResponse;
  //     // if ((response.errorCode == 0)) {
  //     //   return -2;
  //     // } else if (response.errorMessage == null) {

  //     await preference.setAccessToken(config.accessToken);
  //     await preference.setRefreshToken(config.accessToken);

  //     return 1;
  //     // } else if (response.errorMessage != null) {
  //     //   return -1;
  //     // }
  //   }
  //     return 0;
  // }

  Future<UserAuth> login({String? email, String? password}) async {
    //add some delay to give the feel of api call

    // await Future.delayed(Duration(seconds: 3));

    if (email != "nntanhung@gmail.com" || password != "12345678") {
      await preference.setAccessToken(MemCache.accessToken);
      // throw Exception("username and password does not match");
      // return null;
    }

    return Future.value(UserAuth(
        accessToken: MemCache.accessToken,
        refreshToken: MemCache.refreshToken));
  }
}
