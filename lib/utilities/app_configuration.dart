// import 'package:flutter/material.dart';
// import 'package:flutter_flavor/flutter_flavor.dart';

// import 'mem_cache.dart';

// class AppConfiguration {
//   Future<void> loadConfig() async {
//     switch (MemCache.env) {
//       case 'DEV':
//         FlavorConfig(
//             name: 'DEV', variables: {'baseUrl': '', 'authBaseUrl': ''});
//         break;
//       case 'UAT':
//         FlavorConfig(
//             name: 'UAT',
//             color: const Color(0xFF1F78AD),
//             variables: {'baseUrl': '', 'authBaseUrl': ''});
//         break;
//       default:
//         FlavorConfig(variables: {'baseUrl': '', 'authBaseUrl': ''});
//     }
//   }

//   String get baseUrl => FlavorConfig.instance.variables['baseUrl'];
//   String get authBaseUrl => FlavorConfig.instance.variables['authBaseUrl'];
// }
