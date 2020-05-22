import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttersinyi/src/blocs/token_bloc.dart';

import '../../main.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TokenBloc tokenBloc;
  var loginText = "請輸入帳號";

  @override
  Widget build(BuildContext context) {
    tokenBloc = BlocProvider.getBloc<TokenBloc>();
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(90.0),
            child: new Text(loginText),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var isLogin = await tokenBloc.login();
          setState(() {
            if (isLogin) {
              loginText = tokenBloc.tokenBean.UserID;
            } else {
              loginText = tokenBloc.responseErrDesc;
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
