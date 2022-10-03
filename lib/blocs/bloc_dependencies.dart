import 'package:get_it/get_it.dart';

import 'tickets/ticket_list_bloc.dart';

class BlocDependencies {
  static void init(GetIt injector) {
    injector.registerFactory<TicketListCubit>(() => TicketListCubit());
  }
}
