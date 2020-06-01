import 'package:flutter/material.dart';
import 'package:fluttersinyi/src/screens/login/login_page-bloc.dart';
import 'package:fluttersinyi/src/theme/style.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChange;
  final LoginPageBloc loginPageBloc;

  const TextFieldWidget({
    Key key,
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText,
    this.onChange,
    this.loginPageBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      obscureText: obscureText,
      style: TextStyle(
        color: Global.mediumBlue,
        fontSize: 14.0,
      ),
      cursorColor: Global.mediumBlue,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Global.mediumBlue,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            loginPageBloc.isVisible = !loginPageBloc.isVisible;
          },
          child: Icon(
            suffixIconData,
            size: 18,
            color: Global.mediumBlue,
          ),
        ),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Global.mediumBlue),
        ),
        labelStyle: TextStyle(color: Global.mediumBlue),
        focusColor: Global.mediumBlue,
      ),
    );
  }
}
