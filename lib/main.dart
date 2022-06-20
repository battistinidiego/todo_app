import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/route.dart';
import 'package:todo_app/services/local_storage_service.dart';
import 'package:todo_app/services/theme_service.dart';
import 'package:todo_app/view_models/todo_view_model.dart';

void main() async {
  final localStorageService = LocalStorageService();
  await localStorageService.initializeHive();
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoViewModel>(create: (_) => TodoViewModel()),
        ChangeNotifierProvider<ThemeService>(create: (_) => ThemeService()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
            initialRoute: RouteGenerator.homePageRouteName, // '/'
            onGenerateRoute: RouteGenerator.routeGenerator,
            title: 'Todo',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.orange,
                  brightness: context.watch<ThemeService>().isDarkMode
                      ? Brightness.dark
                      : Brightness.light),
            ));
      }),
    );
  }
}
