import 'dart:convert';
import 'package:flutter/services.dart';

class Env {
  static final Env _instance = Env._internal();
  static Map<String, dynamic>? _config;

  factory Env() {
    return _instance;
  }

  Env._internal();

  static Future<void> load(String env) async {
    final configString = await rootBundle.loadString('assets/env/$env.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  String get apiURL {
    return _config?['base_url'] as String;
  }

  String get appName {
    return _config?['app_name'] ?? "";
  }
}
