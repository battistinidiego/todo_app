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

  UnmodifiableListView<Todo> get items => UnmodifiableListView(_items);

  void add(Todo item) {
    _items.add(item);
  }

  void remove(Todo item) {
    _items.remove(item);
  }

  void complete(Todo item) {
    if (item.completed) {
      item.completed = false;
    } else {
      item.completedAt = DateTime.now();
      item.completed = true;
    }

    notifyListeners();
  }
}
