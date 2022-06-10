import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/routes/info_page.dart';
import 'package:todo_app/services/todo_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // ignore: avoid_returning_null_for_void
        onPressed: () => null,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: Consumer<TodoService>(
        builder: (context, todoService, _) => Center(
          child: ListView.builder(
              itemCount: todoService.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onLongPress: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                InfoPage(item: todoService.items[index]))),
                    child: CheckboxListTile(
                        isThreeLine: true,
                        value: todoService.items[index].completed,
                        title: Text(todoService.items[index].title),
                        subtitle: Text(todoService.items[index].description),
                        activeColor: Theme.of(context).colorScheme.primary,
                        checkColor: Theme.of(context).colorScheme.background,
                        checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onChanged: (value) {
                          todoService.complete(todoService.items[index]);
                        }),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
