import 'package:get_it/get_it.dart';
import 'package:todo_list/blocs/authen/sign_in/sign_in_bloc.dart';
import 'package:todo_list/blocs/bloc.dart';

class BlocDependencies {
  static void init(GetIt injector) {
    injector.registerFactory<CreateTicketBloc>(() => CreateTicketBloc(injector()));
    injector.registerFactory<TicketListBloc>(() => TicketListBloc(injector()));
    injector.registerFactory<SignInBloc>(() => SignInBloc(injector(), injector()));
  }
}
