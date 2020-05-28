import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttersinyi/app_config.dart';
import 'package:fluttersinyi/src/routes.dart';
import 'package:fluttersinyi/src/services/login_web_service.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 0, colors: false, prefix: true, lineLength: 180),
);
final String TAG = "Main";

void main() async {
  // 初始化WebService類別,設定API路徑
  String serverPath = AppConfig.DEBUG ? AppConfig.SINYI_DEVELOPMENT_SERVER : AppConfig.SINYI_PRODUCTION_SERVER;
  logger.d("serverPath " + serverPath);
  String apiUrl = serverPath + "api/TA2/";
  String apiTokenUrl = serverPath + "api/TA2Token/";

  LoginWebService().init(true, apiTokenUrl, 10000, AppConfig.APP_NAME);
  new Routes();
}
