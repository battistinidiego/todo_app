import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/local_storage_service.dart';

class TodoViewModel extends ChangeNotifier {
  List<Todo> get items => LocalStorageService().getAllItems();

  List<Todo> get doneItems => LocalStorageService().getAllDoneItems();

  void add(Todo item) {
    LocalStorageService().saveItem(item);
    notifyListeners();
  }

  void delete(Todo item) {
    LocalStorageService().removeItem(item);
    notifyListeners();
  }

  void complete(Todo item) {
    LocalStorageService().completeItem(item);
    notifyListeners();
  }
}
