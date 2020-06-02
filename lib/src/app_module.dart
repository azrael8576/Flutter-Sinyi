import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'app_bloc.dart';
import 'app_widget.dart';
import 'blocs/blocs.dart';

class AppModule extends ModuleWidget {

  //Inject the blocs
  @override
  List<Bloc<BlocBase>> get blocs => [
    Bloc((i) => TokenBloc()),
    Bloc((i) => AppBloc()),
  ];

  //Inject the dependencies
  @override
  List<Dependency> get dependencies => [
  ];

  //main widget
  @override
  Widget get view => AppWidget();

  //shortcut to pick up dependency injections from this module
  static Inject get to => Inject<AppModule>.of();
}