import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/widgets/dialogs/new_item_dialog.dart';
import 'package:todo_app/widgets/item_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) => Consumer<TodoService>(
                      builder: (context, value, _) => NewItemDialog(
                          onNewItem: ((newItem) => value.add(newItem))),
                    )),
            child: const Icon(Icons.add)),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                icon: const Icon(Icons.settings_outlined))
          ],
          title: const Text("Home"),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
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
        body: [
          ItemList(todoCollection: context.watch<TodoService>().items),
          ItemList(todoCollection: context.watch<TodoService>().doneItems)
        ][_selectedIndex]);
  }
}
