import 'package:flutter/material.dart';
import 'package:fluttersinyi/app_config.dart';
import 'package:fluttersinyi/src/services/login_web_service.dart';
import 'package:logger/logger.dart';

import 'src/app_module.dart';

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 0, colors: false, prefix: true, lineLength: 180),
);
final String TAG = "Main";

void main() async {
  // 初始化WebService類別,設定API路徑
  final String serverPath = AppConfig.DEBUG ? AppConfig.SINYI_DEVELOPMENT_SERVER : AppConfig.SINYI_PRODUCTION_SERVER;
  final String apiUrl = serverPath + AppConfig.API_URI_SIFFIX;
  final String apiTokenUrl = serverPath + AppConfig.API_TOKEN_URI_SIFFIX;
  logger.d('serverPath ' + serverPath);

  LoginWebService().init(true, apiTokenUrl, 10000, AppConfig.APP_NAME);
  runApp(AppModule());
}
