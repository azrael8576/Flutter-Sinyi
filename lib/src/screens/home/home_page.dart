import 'package:flutter/material.dart';
import 'package:fluttersinyi/src/blocs/token_bloc.dart';
import 'package:fluttersinyi/src/screens/home/home_module.dart';
import 'package:fluttersinyi/src/theme/style.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(100.0),
            child: new Text(
              '登入成功!' + HomeModule.to.bloc<TokenBloc>().userId,
              style: TextStyle(
                color: Global.mediumBlue,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
