import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app_dependencies.dart';
import 'routers/app_router.dart';
import 'themes/app_themes.dart';

class TodoListApp extends StatelessWidget {
  final _appRouter = AppDependencies.injector.get<AppRouter>();
  final bool isInitialCompleted;

  TodoListApp({Key? key,
   required this.isInitialCompleted,
   }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: 'Todo List App',
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      builder: EasyLoading.init(),
    );
  }
}
