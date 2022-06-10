import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/routes/home_page.dart';
import 'package:todo_app/services/todo_service.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      home: ChangeNotifierProvider<TodoService>(
        create: (context) => TodoService(),
        child: const HomePage(),
      ),
    );
  }
}
