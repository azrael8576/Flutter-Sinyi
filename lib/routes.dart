import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttersinyi/src/blocs/token_bloc.dart';
import 'package:fluttersinyi/src/ui/home/home_page.dart';
import 'package:fluttersinyi/src/ui/login/bloc/login_bloc.dart';
import 'package:fluttersinyi/src/ui/login/login_page.dart';

class Routes {
  Routes() {
    runApp(
      BlocProvider(
        blocs: [
          Bloc((i) => TokenBloc()),
          Bloc((i) => (LoginBloc())),
        ],
        child: (MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Sinyi Demo",
          home: LoginPage(),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/login':
                return new MyCustomRoute(
                  builder: (_) => new LoginPage(),
                  settings: settings,
                );
                break;
              case '/home':
                return new MyCustomRoute(
                  builder: (_) => new HomePage(),
                  settings: settings,
                );
                break;
              default:
                {
                  return new MyCustomRoute(
                    builder: (_) => new LoginPage(),
                    settings: settings,
                  );
                }
                break;
            }
          },
        )),
      ),
    );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
