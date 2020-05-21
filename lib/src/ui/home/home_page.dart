import 'dart:convert';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(90.0),
            child: new Text('登入成功!'),
          ),
        ],
      ),
    );
  }
}