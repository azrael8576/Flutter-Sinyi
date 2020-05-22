import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttersinyi/net/ws/login_web_service.dart';
import 'package:fluttersinyi/src/blocs/token_bloc.dart';
import 'package:fluttersinyi/src/ui/login_page.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 0, colors: false, prefix: true, lineLength: 180),
);
final String APP_NAME = "TA2";
final String TAG = "Main";

void main() async {
  // 初始化WebService類別,設定API路徑
  String serverPath = "http://apiv2test.sinyi.com.tw/";
  logger.d("serverPath " + serverPath);
  String apiUrl = serverPath + "api/TA2/";
  String apiTokenUrl = serverPath + "api/TA2Token/";
  LoginWebService().init(true, apiTokenUrl, 10000, APP_NAME);

  runApp(
    BlocProvider(
      blocs: [Bloc((i) => TokenBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Sinyi Demo",
        home: LoginPage(),
      ),
    ),
  );
}
