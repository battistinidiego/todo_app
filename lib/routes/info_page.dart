import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/view_models/todo_view_model.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Todo item;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoViewModel>(
      builder: (context, provider, _) => Scaffold(
          floatingActionButton:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                    Text(item.completedAtToString),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
