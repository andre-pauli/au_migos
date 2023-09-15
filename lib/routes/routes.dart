import 'package:au_migos/pages/home_page.dart';
import 'package:au_migos/routes/routes_string.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    RoutesString.home: (context) => const HomePage()
  };

  static String initial = RoutesString.home;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
