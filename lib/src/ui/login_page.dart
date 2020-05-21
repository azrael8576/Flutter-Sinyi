import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttersinyi/src/net/ws/login_web_service.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(90.0),
            child: new Text('請輸入帳號!'),
          ),
        ],
      ),
    );
  }
}