import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/todo_service.dart';

class InfoPage extends StatelessWidget {
  final Todo item;

  const InfoPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoService>(
      builder: (context, provider, _) => Scaffold(
          floatingActionButton:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            FloatingActionButton(
              heroTag: 'InfoEdit_fab',
              onPressed: () {
                return;
              },
              child: const Icon(Icons.edit_outlined),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: 'infoDelete_fab',
              onPressed: () {
                provider.delete(item);
                Navigator.pop(context);
              },
              child: const Icon(Icons.delete_outline),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: 'InfoDone_fab',
              onPressed: () {
                provider.complete(item);
                Navigator.pop(context);
              },
              child: const Icon(Icons.check_outlined),
            ),
          ]),
          appBar: AppBar(
            title: Text(item.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.description),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text('Done: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary)),
                    Text(item.completedAtString),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
