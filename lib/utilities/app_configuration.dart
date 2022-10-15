import 'package:global_configs/global_configs.dart';

class AppConfiguration {
  Future init() async {
    await GlobalConfigs()
        .loadJsonFromdir('assets/cfg/config_base.json');
  }

  int getInt(String key) {
    var num = GlobalConfigs().get(key);
    if (num is int) return num;
    return num?.toInt();
  }

  String getString(String key) {
    return GlobalConfigs().get<String?>(key) ?? '';
  }

  int get timeLimit => getInt('timeLimit');
  String get baseUrl => getString('base_url');
  String get accessToken => getString('access_oken');

  
}
