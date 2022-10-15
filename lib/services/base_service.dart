import '../app_dependencies.dart';
import '../preference/user_preference.dart';
import '../utilities/app_configuration.dart';
import '../utilities/network/rest_utility.dart';

abstract class BaseService {
  final rest = AppDependencies.injector.get<RestUtils>();
  final config = AppDependencies.injector.get<AppConfiguration>();
    final preference = AppDependencies.injector.get<UserPreference>();

} 

