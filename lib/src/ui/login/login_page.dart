import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttersinyi/src/blocs/token_bloc.dart';
import 'package:fluttersinyi/src/common/globals.dart';
import 'package:fluttersinyi/src/ui/widgets/button_widget.dart';
import 'package:fluttersinyi/src/ui/widgets/textfield_widget.dart';
import 'package:fluttersinyi/src/ui/widgets/wave_widget.dart';

import '../../../main.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TokenBloc tokenBloc = BlocProvider.getBloc<TokenBloc>();
    final LoginBloc loginBloc = BlocProvider.getBloc<LoginBloc>();
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return new Scaffold(
      backgroundColor: Global.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height - 200,
            color: Global.mediumBlue,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Global.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Login', style: TextStyle(color: Global.white, fontSize: 40.0, fontWeight: FontWeight.w900),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 25.0,
                ),
                Consumer<LoginBloc>(
                  builder: (BuildContext context, LoginBloc bloc) {
                    return TextFieldWidget(
                      hintText: 'Email',
                      obscureText: false,
                      prefixIconData: Icons.mail_outline,
                      suffixIconData: bloc.isValid ? Icons.check : null,
                      onChange: (value) {
                        loginBloc.isValidEmail(value);
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Consumer<LoginBloc>(
                        builder: (BuildContext context, LoginBloc bloc) {
                      return TextFieldWidget(
                        hintText: 'Password',
                        obscureText: bloc.isVisible,
                        prefixIconData: Icons.lock_outline,
                        suffixIconData: bloc.isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      );
                    }),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Global.mediumBlue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonWidget(
                  title: 'Login',
                  hasBorder: false,
                ),
                SizedBox(
                  height: 10.0,
                ),
                ButtonWidget(
                  title: 'Sign Up',
                  hasBorder: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
