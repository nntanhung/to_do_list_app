import '../../../models/services/service_model.dart';
import '../../../routers/route_keys.dart';
import '../../../services/service.dart';
import '../../../utilities/utility.dart';
import '../../base_bloc/base_bloc.dart';
import '../../bloc.dart';

class SignInBloc extends BaseCubit<BaseState> {
  final AuthenticateService? _authService;
  final User? users;
  SignInBloc(this._authService, this.users) : super(InitialState());

  Future<void> login({String? email, String? password}) async {
    showLoading();
    try {
      UserAuth response = await _authService!
          .login(email: email!.trim().toLowerCase(), password: password!);
      if (response.accessToken == MemCache.accessToken) {
        emit(SignInSuccess(nextPage: RouteKey.tickets));
      } else {
        emit(SignInFail(errorMessage: 'errorMessage'));
      }
      await dismissLoading();
    } catch (e) {
      emit(SignInFail(errorMessage: 'message faild'));
      await dismissLoading();
    }
  }
}
