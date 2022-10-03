import 'package:basic_utils/basic_utils.dart';

import '../mem_cache.dart';
import 'authorization.dart';

class AuthenticationUtility {

  AuthenticationUtility();

  Future<bool> checkRole(String role) async {
    if (StringUtils.isNullOrEmpty(MemCache.userRoles)) return false;
    return MemCache.userRoles.contains(role);
  }

  Future<bool> checkPermission(String permission) async {
    if (StringUtils.isNullOrEmpty(MemCache.permissions)) return false;
    return MemCache.permissions.contains(permission);
  }

  Future<bool> hasRights(Authorization author) async {
    bool hasRole = false, hasPermission = false;
    for (var role in author.roles) {
      if (await checkRole(role)) {
        hasRole = true;
        break;
      }
    }

    for (var permission in author.permissions) {
      if (await checkPermission(permission)) {
        hasPermission = true;
        break;
      }
    }

    return hasRole && hasPermission;
  }

  Future<bool> hasRoles(Authorization author) async {
    bool hasRole = false;
    for (var role in author.roles) {
      if (await checkRole(role)) {
        hasRole = true;
        break;
      }
    }
    return hasRole;
  }
}
