import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/todo_service.dart';

class ItemList extends StatelessWidget {
  final List<Todo> todoCollection;

  const ItemList({Key? key, required this.todoCollection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todoCollection.length,
        itemBuilder: (context, index) {
          return Consumer<TodoService>(
            builder: (context, provider, _) => Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onLongPress: () => Navigator.pushNamed(context, '/info',
                    arguments: todoCollection[index]),
                child: CheckboxListTile(
                    value: todoCollection[index].completed,
                    title: Text(todoCollection[index].title),
                    subtitle: Text(todoCollection[index].description),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.background,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onChanged: (_) {
                      provider.complete(todoCollection[index]);
                    }),
              ),
            ),
          );
        });
  }
}
