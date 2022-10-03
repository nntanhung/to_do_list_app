import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_dependencies.dart';
import 'todo_list_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final isInitialCompleted = await initApp();
  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('vi'), Locale('en')],
      startLocale: const Locale('vi'),
      fallbackLocale: const Locale('vi'),
      child: TodoListApp(
        // isInitialCompleted: true,
      )));
}

Future<bool> initApp() async {
  try {
    final bool result = await AppDependencies.initialize();
    return result;
  } catch (e) {
    return false;
  }
}
