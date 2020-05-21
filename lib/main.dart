import 'package:flutter/material.dart';
import 'package:fluttersinyi/src/net/ws/login_web_service.dart';
import 'package:fluttersinyi/src/ui/login_page.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 0, colors: false, prefix: true, lineLength: 180),
);

final String APP_NAME = "TA2";
final String TAG = "Main";

void main() {
  // 初始化WebService類別,設定API路徑
  String serverPath = "http://apiv2test.sinyi.com.tw/";
  logger.d(TAG, "serverPath " + serverPath);
  String apiUrl = serverPath + "api/TA2/";
  String apiTokenUrl = serverPath + "api/TA2Token/";
  LoginWebService().init(true, apiTokenUrl, 10000, APP_NAME);
  LoginWebService().GetAuthToken("417437", "SummerCozyRock70", "81374642-3004-41cf-a3ea-5c4cb6111d3c", "9999", "1.0.36.393.9999", "TA2", "samsung SM-N9208", "");

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Sinyi Demo",
    home: LoginPage(),
  ));
}
