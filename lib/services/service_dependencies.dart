import 'package:get_it/get_it.dart';
import 'package:todo_list/services/service.dart';

import '../utilities/network/network.dart';
import '../utilities/utility.dart';
import 'ticket_list_service.dart';

class ServiceDependencies {
  static void init(GetIt injector) {
    var config = injector.get<AppConfiguration>();
    injector.registerLazySingleton<RestUtils>(() => RestUtils(config.baseUrl),
        instanceName: 'MAIN');
    injector.registerLazySingleton<RestUtils>(() => RestUtils(config.baseUrl,
        interceptors: [AuthInterceptor(), TokenInterceptor('MAIN')]));
    injector.registerLazySingleton<CreateTicketService>(() => CreateTicketService());
    injector.registerLazySingleton<TicketListService>(() => TicketListService());
    injector.registerLazySingleton<TicketDetailService>(() => TicketDetailService());
    injector.registerLazySingleton<AuthenticateService>(() => AuthenticateService());
  }
}
