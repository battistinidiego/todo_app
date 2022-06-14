import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/routes/home_page.dart';
import 'package:todo_app/routes/info_page.dart';

class RouteGenerator {
  static const homePageRouteName = '/';
  static const infoPageRouteName = '/info';

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case homePageRouteName:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case infoPageRouteName:
        if (args is Todo) {
          return MaterialPageRoute(builder: (_) => InfoPage(item: args));
        }
        throw Exception('Error: route arg is not of type Todo');

      default:
        throw Exception('Error: unknown route');
    }
  }
}
