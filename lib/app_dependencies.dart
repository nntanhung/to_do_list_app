import 'package:get_it/get_it.dart';

import 'blocs/bloc_dependencies.dart';
import 'businesses/business_deependencies.dart';
import 'models/model_dependencies.dart';
import 'repositories/repository_dependencies.dart';
import 'routers/app_router.dart';
import 'routers/authen_guard.dart';
import 'services/service_dependencies.dart';
import 'utilities/network/network.dart';

class AppDependencies {
  static GetIt get injector => GetIt.I;

  static Future<bool> initialize() async {
    // injector.registerLazySingleton<AppConfiguration>(() => AppConfiguration());
    // final AppConfiguration config =
    //     AppDependencies.injector.get<AppConfiguration>();
    // await config.loadConfig();
    // injector.registerLazySingleton<RestUtils>(
    //     () =>
    //         RestUtils(config.authBaseUrl, interceptors: [LoggingInterceptor()]),
    //     instanceName: 'AUTHEN');

    injector.registerLazySingleton<AuthGuard>(() => AuthGuard());

    injector.registerLazySingleton<AppRouter>(
        () => AppRouter(authGuard: injector()));

    BlocDependencies.init(injector);
    BusinessDependencies.init(injector);
    ServiceDependencies.init(injector);
    ModelDependencies.init(injector);
    RepositoryDependencies.init(injector);

    return true;
  }
}
