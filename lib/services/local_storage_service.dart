import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/todo.dart';

class LocalStorageService {
  // Singleton pattern implementation

  static final LocalStorageService _instance = LocalStorageService._internal();

  factory LocalStorageService() {
    return _instance;
  }

  LocalStorageService._internal();

  static const String _itemsBoxKey = 'todo_box';
  static const String _doneItemsBoxKey = 'done_box';

  Future<void> initializeHive() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(1)) {
      // Adapter created by hive_flutter script so
      Hive.registerAdapter(TodoAdapter());
    }

    await Hive.openBox<Todo>(_itemsBoxKey);
    await Hive.openBox<Todo>(_doneItemsBoxKey);
  }

  List<Todo> getAllItems() => Hive.box<Todo>(_itemsBoxKey).values.toList();
  List<Todo> getAllDoneItems() =>
      Hive.box<Todo>(_doneItemsBoxKey).values.toList();

  Future<void> saveItem(Todo todo) async {
    await Hive.box<Todo>(_itemsBoxKey).add(todo);
  }

  void removeItem(Todo item) {
    if (item.completed) {
      delete(Hive.box(_doneItemsBoxKey), item);
    } else {
      delete(Hive.box(_itemsBoxKey), item);
    }
  }

  void completeItem(Todo item) async {
    // Switch behavior based on the current state of the todo (completed or not)
    if (item.completed) {
      Hive.box<Todo>(_itemsBoxKey).add(item);
      delete(Hive.box(_doneItemsBoxKey), item);
    } else {
      delete(Hive.box(_itemsBoxKey), item);
      Hive.box<Todo>(_doneItemsBoxKey).add(item);
    }

    item.onComplete();
  }

  void delete(Box<Todo> box, Todo item) async {
    final Map<dynamic, Todo> map = box.toMap();

    dynamic itemKey;

    map.forEach((key, value) {
      if (value.title == item.title) itemKey = key;
    });

    box.delete(itemKey);
  }
}
