import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoService with ChangeNotifier {
  final _items = [
    Todo(
      title: 'Buy milk',
      description:
          'Milk is a dairy product produced by the milk cow of the animal kingdom.',
    ),
    Todo(
      title: 'Buy eggs',
      description:
          'Eggs are a food produced by the chicken of the animal kingdom.',
    ),
    Todo(
      title: 'Buy bread',
      description:
          'Bread is a food produced by the goat of the animal kingdom.',
    ),
    Todo(
      title: 'Buy cheese',
      description:
          'Cheese is a food produced by the cow of the animal kingdom.',
    ),
  ];
  final _doneItems = [
    Todo(
        title: 'Buy cat food',
        description:
            'Cat food is a dairy product produced by the milk cow of the animal kingdom.',
        completed: true,
        completedAt: DateTime.now())
  ];

  UnmodifiableListView<Todo> get doneItems => UnmodifiableListView(_doneItems);

  UnmodifiableListView<Todo> get items => UnmodifiableListView(_items);

  void complete(Todo item) {
    if (item.completed) {
      item.completed = false;
      waitAnimationThenRemove(_doneItems, item);
      waitAnimationThenAdd(_items, item);
    } else {
      item.completedAt = DateTime.now();
      item.completed = true;
      waitAnimationThenAdd(_doneItems, item);
      waitAnimationThenRemove(_items, item);
    }

    notifyListeners();
  }

  void waitAnimationThenRemove(List<Todo> collection, Todo item) {
    Future.delayed(const Duration(milliseconds: 400), () {
      collection.remove(item);
      notifyListeners();
    });
  }

  void waitAnimationThenAdd(List<Todo> collection, Todo item) {
    Future.delayed(const Duration(milliseconds: 400), () {
      collection.add(item);
      notifyListeners();
    });
  }
}
