import 'package:todo_list/blocs/authen/sign_in/sign_in_state.dart';
import 'package:todo_list/blocs/base_bloc/base_cubit.dart';
import 'package:todo_list/blocs/base_bloc/base_state.dart';
import 'package:todo_list/models/services/user.dart';
import 'package:todo_list/routers/route_keys.dart';
import 'package:todo_list/utilities/mem_cache.dart';

import '../../../models/services/user_auth.dart';
import '../../../services/service.dart';

class SignInBloc extends BaseCubit<BaseState> {
  final AuthenticateService? _authService;
  final User? users;
  SignInBloc(this._authService, this.users) : super(InitialState());

  Future<void> login({String? email, String? password}) async {
    showLoading();
    UserAuth response =
        await _authService!.login(email: email!, password: password!);
    if (response.accessToken == MemCache.accessToken) {
      emit(SignInSuccess(nextPage: RouteKey.tickets));
    } else {
      emit(SignInFail(
        errorMessage: 'errorMessage',
      ));
    }
    await dismissLoading();
  }
}
