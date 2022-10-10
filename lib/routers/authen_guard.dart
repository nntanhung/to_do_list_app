import 'package:auto_route/auto_route.dart';

import '../utilities/logger.dart';

class AuthGuard extends AutoRouteGuard {
  Future<bool> isAuthenticated() async {
    return true;
  }

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    LoggerUtils.d('onNavigation: ${resolver.route.path}');
    if (await isAuthenticated()) {
      LoggerUtils.d('Authenticated');
      resolver.next();
    } else {
      LoggerUtils.d('UnAuthenticated');
    }
  }
}
