import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttersinyi/src/app_module.dart';
import 'package:fluttersinyi/src/blocs/token_bloc.dart';
import 'package:fluttersinyi/src/screens/login/login_module.dart';
import 'package:fluttersinyi/src/screens/login/login_page-bloc.dart';
import 'package:fluttersinyi/src/theme/style.dart';
import 'package:fluttersinyi/src/components/button_widget.dart';
import 'package:fluttersinyi/src/components/textfield_widget.dart';
import 'package:fluttersinyi/src/components/wave_widget.dart';

import '../../../main.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  var size;
  var keyboardOpen;

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
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
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Global.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
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
//                Center(
//                  child: Text(
//                    //TODO
//                    '顯示錯誤訊息',
//                    style: TextStyle(
//                      color: Global.mediumBlue,
//                      fontSize: 18.0,
//                    ),
//                  ),
//                ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Consumer<LoginPageBloc>(
                    tag: LoginModule().runtimeType.toString(),
                    builder: (BuildContext context, LoginPageBloc bloc) {
                      return Consumer<TokenBloc>(
                        tag: AppModule().runtimeType.toString(),
                        builder: (BuildContext context, TokenBloc tokenBloc) {
                          return TextFieldWidget(
                            hintText: 'Email',
                            obscureText: false,
                            prefixIconData: Icons.mail_outline,
                            suffixIconData: bloc.isValid ? Icons.check : null,
                            onChange: (value) {
                              bloc.isValidEmail(value);
                              tokenBloc.userId = value;
                            },
                          );
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
                      Consumer<LoginPageBloc>(
                        tag: LoginModule().runtimeType.toString(),
                        builder: (BuildContext context, LoginPageBloc bloc) {
                          return Consumer<TokenBloc>(
                            tag: AppModule().runtimeType.toString(),
                            builder: (BuildContext context, TokenBloc tokenBloc) {
                              return TextFieldWidget(
                                loginPageBloc: bloc,
                                hintText: 'Password',
                                obscureText: bloc.isVisible,
                                prefixIconData: Icons.lock_outline,
                                suffixIconData: bloc.isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                onChange: (value) {
                                  tokenBloc.password = value;
                                },
                              );
                            },
                          );
                        },
                      ),
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
                    onTap: () async {
                      var loginStatus = await AppModule.to.bloc<TokenBloc>().login();
                      if (loginStatus == true) {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
