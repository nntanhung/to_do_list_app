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
    TicketListRoute.name: (routeData) {
      return MaterialPageX<String>(
        routeData: routeData,
        child: const TicketListPage(),
      );
    },
    CreateTicketRoute.name: (routeData) {
      return MaterialPageX<String>(
        routeData: routeData,
        child: const CreateTicketPage(),
      );
    },
    TicketDetailRoute.name: (routeData) {
      return MaterialPageX<String>(
        routeData: routeData,
        child: const TicketDetailPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/tickets',
          fullMatch: true,
        ),
        RouteConfig(
          TicketListRoute.name,
          path: '/tickets',
        ),
        RouteConfig(
          CreateTicketRoute.name,
          path: '/create-ticket',
          guards: [authGuard],
        ),
        RouteConfig(
          TicketDetailRoute.name,
          path: '/tickets/:id',
          guards: [authGuard],
        ),
        RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/tickets',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [TicketListPage]
class TicketListRoute extends PageRouteInfo<void> {
  const TicketListRoute()
      : super(
          TicketListRoute.name,
          path: '/tickets',
        );

  static const String name = 'TicketListRoute';
}

/// generated route for
/// [CreateTicketPage]
class CreateTicketRoute extends PageRouteInfo<void> {
  const CreateTicketRoute()
      : super(
          CreateTicketRoute.name,
          path: '/create-ticket',
        );

  static const String name = 'CreateTicketRoute';
}

/// generated route for
/// [TicketDetailPage]
class TicketDetailRoute extends PageRouteInfo<void> {
  const TicketDetailRoute()
      : super(
          TicketDetailRoute.name,
          path: '/tickets/:id',
        );

  static const String name = 'TicketDetailRoute';
}
