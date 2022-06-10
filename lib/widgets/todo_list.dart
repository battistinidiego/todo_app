import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/routes/info_page.dart';
import 'package:todo_app/services/todo_service.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todoCollection;

  const TodoList({Key? key, required this.todoCollection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: todoCollection.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onLongPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            InfoPage(item: todoCollection[index]))),
                child: CheckboxListTile(
                    isThreeLine: true,
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
                    onChanged: (value) {
                      context
                          .read<TodoService>()
                          .complete(todoCollection[index]);
                    }),
              ),
            );
          }),
    );
  }
}
