// import '../app_dependencies.dart';
// import '../utilities/network/network.dart';
// import '../utilities/network/rest_utility.dart';
// import 'base_service.dart';

// class AuthenticateService extends BaseService {
//   AuthenticateService();
//   final _rest = AppDependencies.injector.get<RestUtils>(instanceName: 'MAIN');



//   Future<int> basicLogin({
//     required String email,
//     required String password,
//   }) async {
//     // final request = AuthenticateRequest()
//     //   ..email = 'email@gmail.com'
//     //   ..password = '123456';
//     // var response = await _rest.request<AuthenticateResponse>(
//     //     Method.post, '/api/v1/auth/authenticate',
//     //     data: request.toJson());
//     return 1;
//   }

//   // Future<int> processLoginResponse(
//   //     DataResult<DataResponse<AuthenticateResponse>> result) async {
//   //   if (result.isSuccess) {
//   //     final response = result.data!.dataResponse;
//   //     if ((response.errorCode == ConfigBE.userMustChangePasword)) {
//   //       return -2;
//   //     } else if (response.errorMessage == null) {
//   //       final payload = Jwt.parseJwt(response.accessToken!);
//   //       final userType = payload['userType'];
//   //       if (userType == UserType.customer) {
//   //         return -1;
//   //       }

//   //       await preference.setAccessToken(response.accessToken!);
//   //       await preference.setRefreshToken(response.refreshToken!);
//   //       await preference.setExpiredDate(
//   //           DateTime.now().add(Duration(seconds: response.expiry! - 30)));
//   //       final permissions =
//   //           await PermissionUtility.getPermissionStringFromToken(
//   //               response.accessToken!);
//   //       await preference.setPermissions(permissions);
//   //       await preference.setUserType(userType);

//   //       final userID =
//   //           TokenUtility.getDataByKey(response.accessToken!, TokenKey.userId);
//   //       if (StringUtils.isNotNullOrEmpty(userID)) {
//   //         await preference.setUserId(userID!);
//   //       }

//   //       final clubIDs =
//   //           TokenUtility.getDataByKey(response.accessToken!, TokenKey.clubIds);
//   //       if (StringUtils.isNotNullOrEmpty(clubIDs)) {
//   //         await preference.setClubIds(clubIDs!);
//   //       } else {
//   //         await preference.setClubIds(null);
//   //       }

//   //       final userName = TokenUtility.getDataByKey(
//   //           response.accessToken!, TokenKey.uniqueName);
//   //       if (StringUtils.isNotNullOrEmpty(userName)) {
//   //         await preference.setUserName(userName!);
//   //       }

//   //       final chainId =
//   //           TokenUtility.getDataByKey(response.accessToken!, TokenKey.chainId);
//   //       if (StringUtils.isNotNullOrEmpty(chainId)) {
//   //         await preference.setChainId(chainId!);
//   //       } else {
//   //         await preference.setChainId(null);
//   //       }

//   //       return 1;
//   //     } else if (response.errorMessage != null) {
//   //       return -1;
//   //     }
//   //   }
//   //   return 0;
//   // }
// }
