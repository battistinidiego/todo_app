import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo {
  Todo(
      {required this.title,
      this.completed = false,
      required this.description,
      this.completedAt});

  @HiveField(1)
  bool completed;

  @HiveField(3)
  DateTime? completedAt;

  @HiveField(2)
  String description;

  @HiveField(0)
  String title;

  String get completedAtToString => completed
      ? "${completedAt?.day}/${completedAt?.month}/${completedAt?.year} at ${completedAt?.hour}:${completedAt?.minute}"
      : 'No';

  void onComplete() {
    completed = !completed;
    completed ? completedAt = DateTime.now() : completedAt = null;
  }
}
