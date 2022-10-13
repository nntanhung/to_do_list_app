import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/screens/authen/forgot_password.dart';
import 'package:todo_list/screens/tickets/create_ticket/create_ticket_screen.dart';

import '../screens/screen.dart';
import '../screens/tickets/ticket_list_page.dart';
import 'authen_guard.dart';
import 'route_keys.dart';

part 'app_router.gr.dart';  

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Page,Route',
  routes: <AutoRoute>[
    // app stack
    AutoRoute<String>(
        path: RouteKey.root,
        page: SignInScreen),
    AutoRoute<String>(
        path: RouteKey.tickets,
        page: TicketListPage, guards: [AuthGuard]),
    AutoRoute<String>(
        path: RouteKey.ticketDetail, page: TicketDetailScreen, guards: [AuthGuard]),
    AutoRoute<String>(path: RouteKey.signUp, page: SignUpScreen),
    AutoRoute<String>(path: RouteKey.signIn, page: SignInScreen),
    AutoRoute<String>(path: RouteKey.forgotPassword, page: ForgotPassword),
    AutoRoute<String>(path: RouteKey.createTicket, page: CreateTicketScreen),

    RedirectRoute(path: '*', redirectTo: RouteKey.root),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required AuthGuard authGuard}) : super(authGuard: authGuard);
}
