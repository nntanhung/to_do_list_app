import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/page.dart';
import '../pages/tickets/ticket_list_page.dart';
import 'authen_guard.dart';
import 'route_keys.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // app stack
    AutoRoute<String>(
        path: RouteKey.root,
        page: TicketListPage),
    AutoRoute<String>(
        path: RouteKey.createTicket, page: CreateTicketPage, guards: [AuthGuard]),
    AutoRoute<String>(
        path: RouteKey.ticketDetail, page: TicketDetailPage, guards: [AuthGuard]),

    RedirectRoute(path: '*', redirectTo: RouteKey.root),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required AuthGuard authGuard}) : super(authGuard: authGuard);
}
