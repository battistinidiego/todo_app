import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _appBarTitle = 'Todos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () => null, child: const Icon(Icons.add)),
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
            _selectedIndex == 0
                ? _appBarTitle = 'Todos'
                : _appBarTitle = 'Done';
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.error_outline),
            label: 'Todos',
          ),
          NavigationDestination(
            icon: Icon(Icons.done_all_outlined),
            label: 'Done',
          ),
        ],
      ),
      body: Consumer<TodoService>(
        builder: ((context, value, child) {
          return _selectedIndex == 0
              ? TodoList(todoCollection: value.items)
              : TodoList(todoCollection: value.doneItems);
        }),
      ),
    );
  }
}
