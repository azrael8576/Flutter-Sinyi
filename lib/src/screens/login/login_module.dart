import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttersinyi/src/blocs/token_bloc.dart';
import 'package:fluttersinyi/src/screens/login/login_page.dart';

import 'login_page-bloc.dart';

class LoginModule extends ModuleWidget {

  //Inject the blocs
  @override
  List<Bloc<BlocBase>> get blocs => [
    Bloc((i) => BlocProvider.getBloc<TokenBloc>()),
    Bloc((i) => LoginPageBloc()),
  ];

  //Inject the dependencies
  @override
  List<Dependency> get dependencies => [
  ];

  //main widget
  @override
  Widget get view => LoginPage();

  //shortcut to pick up dependency injections from this module
  static Inject get to => Inject<LoginModule>.of();
}