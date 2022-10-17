import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_dependencies.dart';
import 'preference/user_preference.dart';
import 'todo_list_app.dart';
import 'utilities/dialog_utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final isInitialCompleted = await initApp();
  EasyLoading.configLoading();
  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('vi'), Locale('en')],
      // startLocale: const Locale('vi'),
      // fallbackLocale: const Locale('vi'),
      child: TodoListApp(
        isInitialCompleted: isInitialCompleted,
      )));
}

Future<bool> initApp() async {
  try {
    final bool result = await AppDependencies.initialize();
    
  final pref = AppDependencies.injector.get<UserPreference>();
   await pref.setStatic();
    return result;
    
  } catch (e) {
    return false;
  }
}


