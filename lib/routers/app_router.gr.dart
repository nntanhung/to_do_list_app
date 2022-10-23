// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    SignInScreenRoute.name: (routeData) {
      return MaterialPageX<String>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    TicketListScreenRoute.name: (routeData) {
      return MaterialPageX<String>(
        routeData: routeData,
        child: const TicketListScreen(),
      );
    },
    TicketDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TicketDetailScreenRouteArgs>(
          orElse: () => TicketDetailScreenRouteArgs(
              ticketId: pathParams.optString('id')));
      return MaterialPageX<String>(
        routeData: routeData,
        child: TicketDetailScreen(
          key: args.key,
          ticketId: args.ticketId,
        ),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return MaterialPageX<String>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    ForgotPasswordScreenRoute.name: (routeData) {
      return MaterialPageX<String>(
        routeData: routeData,
        child: const ForgotPasswordScreen(),
      );
    },
    CreateTicketScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CreateTicketScreenRouteArgs>(
          orElse: () => const CreateTicketScreenRouteArgs());
      return MaterialPageX<String>(
        routeData: routeData,
        child: CreateTicketScreen(
          key: args.key,
          ticketList: args.ticketList,
          titleScreen: args.titleScreen,
        ),
      );
    },
    LogOutScreenRoute.name: (routeData) {
      return MaterialPageX<String>(
        routeData: routeData,
        child: const LogOutScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SignInScreenRoute.name,
          path: '/sign-in',
        ),
        RouteConfig(
          TicketListScreenRoute.name,
          path: '/tickets',
          guards: [authGuard],
        ),
        RouteConfig(
          TicketDetailScreenRoute.name,
          path: '/tickets/:id',
          guards: [authGuard],
        ),
        RouteConfig(
          SignUpScreenRoute.name,
          path: '/sign-up',
        ),
        RouteConfig(
          SignInScreenRoute.name,
          path: '/sign-in',
        ),
        RouteConfig(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password',
        ),
        RouteConfig(
          CreateTicketScreenRoute.name,
          path: '/create-ticket',
        ),
        RouteConfig(
          LogOutScreenRoute.name,
          path: '/log-out',
        ),
        RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/sign-in',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [SignInScreen]
class SignInScreenRoute extends PageRouteInfo<void> {
  const SignInScreenRoute()
      : super(
          SignInScreenRoute.name,
          path: '/sign-in',
        );

  static const String name = 'SignInScreenRoute';
}

/// generated route for
/// [TicketListScreen]
class TicketListScreenRoute extends PageRouteInfo<void> {
  const TicketListScreenRoute()
      : super(
          TicketListScreenRoute.name,
          path: '/tickets',
        );

  static const String name = 'TicketListScreenRoute';
}

/// generated route for
/// [TicketDetailScreen]
class TicketDetailScreenRoute
    extends PageRouteInfo<TicketDetailScreenRouteArgs> {
  TicketDetailScreenRoute({
    Key? key,
    String? ticketId,
  }) : super(
          TicketDetailScreenRoute.name,
          path: '/tickets/:id',
          args: TicketDetailScreenRouteArgs(
            key: key,
            ticketId: ticketId,
          ),
          rawPathParams: {'id': ticketId},
        );

  static const String name = 'TicketDetailScreenRoute';
}

class TicketDetailScreenRouteArgs {
  const TicketDetailScreenRouteArgs({
    this.key,
    this.ticketId,
  });

  final Key? key;

  final String? ticketId;

  @override
  String toString() {
    return 'TicketDetailScreenRouteArgs{key: $key, ticketId: $ticketId}';
  }
}

/// generated route for
/// [SignUpScreen]
class SignUpScreenRoute extends PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/sign-up',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [ForgotPasswordScreen]
class ForgotPasswordScreenRoute extends PageRouteInfo<void> {
  const ForgotPasswordScreenRoute()
      : super(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password',
        );

  static const String name = 'ForgotPasswordScreenRoute';
}

/// generated route for
/// [CreateTicketScreen]
class CreateTicketScreenRoute
    extends PageRouteInfo<CreateTicketScreenRouteArgs> {
  CreateTicketScreenRoute({
    Key? key,
    TicketResultResponse? ticketList,
    String? titleScreen,
  }) : super(
          CreateTicketScreenRoute.name,
          path: '/create-ticket',
          args: CreateTicketScreenRouteArgs(
            key: key,
            ticketList: ticketList,
            titleScreen: titleScreen,
          ),
        );

  static const String name = 'CreateTicketScreenRoute';
}

class CreateTicketScreenRouteArgs {
  const CreateTicketScreenRouteArgs({
    this.key,
    this.ticketList,
    this.titleScreen,
  });

  final Key? key;

  final TicketResultResponse? ticketList;

  final String? titleScreen;

  @override
  String toString() {
    return 'CreateTicketScreenRouteArgs{key: $key, ticketList: $ticketList, titleScreen: $titleScreen}';
  }
}

/// generated route for
/// [LogOutScreen]
class LogOutScreenRoute extends PageRouteInfo<void> {
  const LogOutScreenRoute()
      : super(
          LogOutScreenRoute.name,
          path: '/log-out',
        );

  static const String name = 'LogOutScreenRoute';
}
