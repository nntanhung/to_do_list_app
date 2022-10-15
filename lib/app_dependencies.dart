import 'package:get_it/get_it.dart';

import 'blocs/bloc_dependencies.dart';
import 'businesses/business_deependencies.dart';
import 'models/model_dependencies.dart';
import 'preference/user_preference.dart';
import 'repositories/repository_dependencies.dart';
import 'routers/app_router.dart';
import 'routers/authen_guard.dart';
import 'services/service_dependencies.dart';
import 'utilities/app_configuration.dart';
import 'utilities/network/network.dart';
import 'validator/validator_dependencies.dart';

class AppDependencies {
  static GetIt get injector => GetIt.I;

  static Future<bool> initialize() async {
    injector.registerLazySingleton<AppConfiguration>(() => AppConfiguration());
    final AppConfiguration config =
        AppDependencies.injector.get<AppConfiguration>();
    // await config.init();
    injector.registerLazySingleton<RestUtils>(
        () => RestUtils(config.baseUrl, interceptors: [LoggingInterceptor()]),
        instanceName: 'AUTHEN');

    injector.registerLazySingleton<UserPreference>(() => UserPreference());

    injector.registerLazySingleton<AuthGuard>(() => AuthGuard());

    injector.registerLazySingleton<AppRouter>(
        () => AppRouter(authGuard: injector()));

    BlocDependencies.init(injector);
    BusinessDependencies.init(injector);
    ServiceDependencies.init(injector);
    ModelDependencies.init(injector);
    RepositoryDependencies.init(injector);
    ValidatorDependencies.init(injector);
    await injector.get<AppConfiguration>().init();

    return true;
  }
}
