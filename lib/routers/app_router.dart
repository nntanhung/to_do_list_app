import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/screens/authen/forgot_password.dart';

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
        page: TicketListScreen),
    AutoRoute<String>(
        path: RouteKey.createTicket, page: CreateTicketScreen, guards: [AuthGuard]),
    AutoRoute<String>(
        path: RouteKey.ticketDetail, page: TicketDetailScreen, guards: [AuthGuard]),
    AutoRoute<String>(path: RouteKey.signUp, page: SignUpScreen),
    AutoRoute<String>(path: RouteKey.signIn, page: SignInScreen),
    AutoRoute<String>(path: RouteKey.forgotPassword, page: ForgotPassword),

    RedirectRoute(path: '*', redirectTo: RouteKey.root),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required AuthGuard authGuard}) : super(authGuard: authGuard);
}
