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
    CreateTicketScreenRoute.name: (routeData) {
      return MaterialPageX<String>(
        routeData: routeData,
        child: const CreateTicketScreen(),
      );
    },
    TicketDetailScreenRoute.name: (routeData) {
      return MaterialPageX<String>(
        routeData: routeData,
        child: const TicketDetailScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpScreenRouteArgs>(
          orElse: () => const SignUpScreenRouteArgs());
      return MaterialPageX<String>(
        routeData: routeData,
        child: SignUpScreen(
          predemType: args.predemType,
          predemCode: args.predemCode,
          phone: args.phone,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return MaterialPageX<String>(
        routeData: routeData,
        child: const ForgotPassword(),
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
        ),
        RouteConfig(
          CreateTicketScreenRoute.name,
          path: '/create-ticket',
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
          ForgotPasswordRoute.name,
          path: '/forgot-password',
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
/// [CreateTicketScreen]
class CreateTicketScreenRoute extends PageRouteInfo<void> {
  const CreateTicketScreenRoute()
      : super(
          CreateTicketScreenRoute.name,
          path: '/create-ticket',
        );

  static const String name = 'CreateTicketScreenRoute';
}

/// generated route for
/// [TicketDetailScreen]
class TicketDetailScreenRoute extends PageRouteInfo<void> {
  const TicketDetailScreenRoute()
      : super(
          TicketDetailScreenRoute.name,
          path: '/tickets/:id',
        );

  static const String name = 'TicketDetailScreenRoute';
}

/// generated route for
/// [SignUpScreen]
class SignUpScreenRoute extends PageRouteInfo<SignUpScreenRouteArgs> {
  SignUpScreenRoute({
    String? predemType,
    String? predemCode,
    String? phone,
  }) : super(
          SignUpScreenRoute.name,
          path: '/sign-up',
          args: SignUpScreenRouteArgs(
            predemType: predemType,
            predemCode: predemCode,
            phone: phone,
          ),
        );

  static const String name = 'SignUpScreenRoute';
}

class SignUpScreenRouteArgs {
  const SignUpScreenRouteArgs({
    this.predemType,
    this.predemCode,
    this.phone,
  });

  final String? predemType;

  final String? predemCode;

  final String? phone;

  @override
  String toString() {
    return 'SignUpScreenRouteArgs{predemType: $predemType, predemCode: $predemCode, phone: $phone}';
  }
}

/// generated route for
/// [ForgotPassword]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(
          ForgotPasswordRoute.name,
          path: '/forgot-password',
        );

  static const String name = 'ForgotPasswordRoute';
}
