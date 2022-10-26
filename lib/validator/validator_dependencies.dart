import 'package:get_it/get_it.dart';
import 'sign_up_validator.dart';
class ValidatorDependencies {
  static void init(GetIt injector) {
    injector.registerLazySingleton<SignUpValidator>(() => SignUpValidator());
  }
}
