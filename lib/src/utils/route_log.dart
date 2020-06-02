import '../../main.dart';

class RouteLog {
  static final RouteLog _singleton = RouteLog._internal();
  factory RouteLog() {
    return _singleton;
  }
  RouteLog._internal();

  var currentRoute;
  var log = '';
  var index = 1;

  setTag([String routeTag]) {
    if (routeTag != null) {
      currentRoute = routeTag;
      log =
          ('' == log) ? '$index  $currentRoute' : '$log\n$index  $currentRoute';
      index++;
    }
  }

  void print() {
    logger.d('RouteLog', log);
  }
}
