import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class NewItemDialog extends StatelessWidget {
  final Function(Todo) onNewItem;

  const NewItemDialog({Key? key, required this.onNewItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "New Todo",
                style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Brush theeth',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Use my new Toothbrush!',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    onNewItem(Todo(
                      title: titleController.text,
                      description: descriptionController.text,
                    ));
                    Navigator.pop(context);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
