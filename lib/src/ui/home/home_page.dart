import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttersinyi/src/blocs/token_bloc.dart';

class HomePage extends StatelessWidget {
  TokenBloc tokenBloc;

  @override
  Widget build(BuildContext context) {
    tokenBloc = BlocProvider.getBloc<TokenBloc>();
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(100.0),
            child: new Text('登入成功!' + tokenBloc.tokenBean.UserID),
          ),
        ],
      ),
    );
  }
}