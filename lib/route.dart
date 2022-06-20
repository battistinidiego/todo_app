import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/routes/home_page.dart';
import 'package:todo_app/routes/info_page.dart';
import 'package:todo_app/routes/settings_page.dart';

class RouteGenerator {
  static const homePageRouteName = '/';
  static const infoPageRouteName = '/info';
  static const settingsPageRouteName = '/settings';

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case homePageRouteName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case infoPageRouteName:
        if (args is Todo) {
          return MaterialPageRoute(builder: (context) => InfoPage(item: args));
        }
        throw Exception('Error: route arg is not of type Todo');
      case settingsPageRouteName:
        return MaterialPageRoute(builder: (context) => const SettingsPage());
      default:
        throw Exception('Error: unknown route');
    }
  }
}
