import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttersinyi/src/blocs/token_bloc.dart';
import 'package:fluttersinyi/src/screens/home/home_module.dart';
import 'package:fluttersinyi/src/screens/login/login_module.dart';


class Routes {
  Routes() {
    runApp(
      BlocProvider(
        blocs: [
          Bloc((i) => TokenBloc()),
        ],
        child: (MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Sinyi Demo",
          home: LoginModule(),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/login':
                return MyCustomRoute(
                  builder: (_) => LoginModule(),
                  settings: settings,
                );
                break;
              case '/home':
                return MyCustomRoute(
                  builder: (_) => HomeModule(),
                  settings: settings,
                );
                break;
              default:
                {
                  return MyCustomRoute(
                    builder: (_) => LoginModule(),
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
