import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/route.dart';
import 'package:todo_app/services/todo_service.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoService>(
      create: (context) => TodoService(),
      child: MaterialApp(
          initialRoute: RouteGenerator.homePageRouteName, // '/'
          onGenerateRoute: RouteGenerator.routeGenerator,
          title: 'Todo',
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange))),
    );
  }
}
