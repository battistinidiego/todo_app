import 'package:flutter/material.dart';

import '../models/todo.dart';

class InfoPage extends StatelessWidget {
  final InfoPageHelper helper;

  const InfoPage({
    Key? key,
    required this.helper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            heroTag: 'InfoEdit_fab',
            onPressed: helper.onEdit(),
            child: const Icon(Icons.edit_outlined),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'infoDelete_fab',
            onPressed: helper.onDelete(),
            child: const Icon(Icons.delete_outline),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'InfoDone_fab',
            onPressed: helper.onComplete(),
            child: const Icon(Icons.check_outlined),
          ),
        ]),
        appBar: AppBar(
          title: Text(helper.item.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(helper.item.description),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text('Done: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary)),
                  Text(helper.item.completedAtString),
                ],
              ),
            ],
          ),
        ));
  }
}

class InfoPageHelper {
  Todo item;

  InfoPageHelper({
    required this.item,
    required this.onComplete,
    required this.onDelete,
    required this.onEdit,
  });

  Function onDelete;
  Function onComplete;
  Function onEdit;
}
