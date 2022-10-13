import 'package:todo_list/blocs/base_bloc/bloc.dart';

import '../../../services/authenticate_service.dart';
import '../../base_bloc/base_cubit.dart';
import 'sign_up_state.dart';

// class SignUpBloc extends BaseCubit {
  // final AuthenticateService _authService;

  // SignUpBloc(this._authService) : super(InitialState());

  // @override
  // void initState() {}

  // Future<void> signUp({required String email, required String password}) async {
  //   // showLoading();
  //   var response =
  //       await _authService.basicLogin(email: email, password: password);
  //   if (response == 1) {
      // await _setPreference();

      // emit(());
      //   }
      // } else {
      //   final errorMessage = response == ConfigBE.changePassword
      //       ? tr('must_change_password')
      //       : tr('SignUp_fail');
      //   emit(SignUpFail(errorMessage: errorMessage, code: response));
      // }
      // await dismissLoading();
    // }

    // Future<void> _setPreference() async {
      //var profile = await profileService.getProfile(GetProfileRequest());
      // if (profile.success) {
      //   await pref.setProfileId(profile.id);
      //   await pref.setProfileType(profile.profileType);
      //   var isOnboard = profile.onboarded == 1;
      //   model.userMode = profile.profileType;
      //   if (isOnboard) {
      //     await pref.setOnboarded(true);
      //     model.SignUpStatus = SignUpStatus.OldUser;
      //   } else {
      //     model.SignUpStatus = SignUpStatus.NewUser;
      //   }
      //   //final deviceToken = await FirebaseMessagesUtils().getDeviceToken();
      //   //Call api push device token
      // } else {
      //   model.SignUpStatus = SignUpStatus.SignUpFailure;
      // }
    // }
  // }
// }
