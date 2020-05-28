import 'package:flutter/material.dart';

class Global {
  static const Color white = const Color(0xffffffff);
  static const Color mediumBlue = const Color(0xff4A64FE);
  static const List validEmail = ['417437'];
}
ThemeData appTheme() {
  return ThemeData(
    primaryColor: Colors.white,
    accentColor: Colors.orange,
    hintColor: Colors.white,
    dividerColor: Colors.white,
    buttonColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    canvasColor: Colors.black,
  );
}