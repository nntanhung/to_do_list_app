import 'package:get_it/get_it.dart';
import 'package:todo_list/models/services/user.dart';
import 'package:todo_list/models/services/user_auth.dart';
import 'package:todo_list/models/views/ticket_list_model.dart';

import 'services/create_ticket.dart';
import 'services/ticket_list.dart';

class ModelDependencies {
  static void init(GetIt injector) {
    injector.registerLazySingleton<CreateTicketResponse>(() => CreateTicketResponse());
    injector.registerLazySingleton<TicketListResponse>(() => TicketListResponse());
    injector.registerLazySingleton<TicketListModel>(() => TicketListModel());
    // injector.registerLazySingleton<TicketResult>(() => TicketResult());
    injector.registerLazySingleton<TicketResultResponse>(() => TicketResultResponse());
    injector.registerLazySingleton<User>(() => User());
    injector.registerLazySingleton<UserAuth>(() => UserAuth());
  }
}
