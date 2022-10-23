import 'package:get_it/get_it.dart';

import 'services/service_model.dart';
import 'views/view_model.dart';

class ModelDependencies {
  static void init(GetIt injector) {
    injector.registerLazySingleton<CreateTicketResponse>(() => CreateTicketResponse());
    injector.registerLazySingleton<TicketListResponse>(() => TicketListResponse());
    injector.registerLazySingleton<TicketListModel>(() => TicketListModel());
    injector.registerLazySingleton<TicketResultResponse>(() => TicketResultResponse());
    injector.registerLazySingleton<User>(() => User());
    injector.registerLazySingleton<UserAuth>(() => UserAuth());
  }
}
