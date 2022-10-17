import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_list/routers/route_keys.dart';

import '../../preference/user_preference.dart';
import 'network.dart';
import '../../app_dependencies.dart';
import '../logger.dart';
import '../mem_cache.dart';

class AuthInterceptor extends Interceptor {
  final _preference = AppDependencies.injector.get<UserPreference>();
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String accessToken = await _preference.accessToken ?? '';
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    //     print('------------ preference ${await _preference.accessToken}');
    // print('---------------- $accessToken}');
    super.onRequest(options, handler);
  }
}

class TokenInterceptor extends QueuedInterceptor {
  final String _mainInstanceName;

  TokenInterceptor(this._mainInstanceName);
  final _preference = AppDependencies.injector.get<UserPreference>();
  
  Future<Map<String, dynamic>?> getToken() async {
    final Map<String, String> params = <String, String>{};
    final String accessToken = await _preference.accessToken ?? ''; 
    final tokenDio =
        AppDependencies.injector.get<RestUtils>(instanceName: 'MAIN');
    params['refreshToken'] = MemCache.refreshToken;
    params['clientId'] = MemCache.clientId;
    try {
      final Response response =
          await tokenDio.dio.post<dynamic>(RouteKey.tickets, data: params);
      if (response.statusCode == ExceptionHandle.success) {
        return (json.decode(response.data.toString()) as Map<String, dynamic>);
      } else if (response.statusCode == ExceptionHandle.unauthorized) {
      }
    } catch (e) {
      LoggerUtils.e('Error: ${e.toString()}');
    }
    return null;
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    //401
    if (response.statusCode == ExceptionHandle.unauthorized) {
      LoggerUtils.d('-----------Request Token------------');
      final RestUtils restUtils = AppDependencies.injector
          .get<RestUtils>(instanceName: _mainInstanceName);
      // final Map<String, dynamic>? token = await getToken();
      final String? accessToken = 'f09da0692d671f4a3dde13a43f7c316bbc8e693b';
      final String? refreshToken = 'f09da0692d671f4a3dde13a43f7c316bbc8e693b';
      LoggerUtils.d(
          '-----------New AccessToken: $accessToken ------------New RefreshToken: $refreshToken');
      MemCache.accessToken = accessToken ?? '';
      MemCache.refreshToken = refreshToken ?? '';

      if (StringUtils.isNotNullOrEmpty(accessToken)) {
        final Dio dio = Dio();
        dio.options = restUtils.dio.options;
        final RequestOptions request = response.requestOptions;
        request.headers['Authorization'] = 'Bearer f09da0692d671f4a3dde13a43f7c316bbc8e693b';

        final Options options = Options(
          headers: request.headers,
          method: request.method,
        );
        try {
          LoggerUtils.d('----------- Re-Request API ------------');
          final Response response = await dio.request<dynamic>(
            request.path,
            data: request.data,
            queryParameters: request.queryParameters,
            cancelToken: request.cancelToken,
            options: options,
            onReceiveProgress: request.onReceiveProgress,
          );
          return handler.next(response);
        } on DioError catch (e) {
          return handler.reject(e);
        }
      }
    }
    super.onResponse(response, handler);
  }
}

