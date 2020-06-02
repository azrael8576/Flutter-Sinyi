import 'package:flutter/material.dart';

import '../main.dart';
import 'screens/home/home_module.dart';
import 'screens/login/login_module.dart';
import 'utils/route_log.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sinyi Demo",
      onGenerateRoute: (RouteSettings settings) {
        RouteLog().setTag(settings.name);
        switch (settings.name) {
          case '/login':
            return MyCustomRoute(
              builder: (_) => LoginModule(),
              settings: settings,
            );
            break;
          case '/home':
            return MyCustomRoute(
              builder: (_) => new HomeModule(),
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
