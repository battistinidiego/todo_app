import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool completed;

  @HiveField(2)
  String description;

  @HiveField(3)
  DateTime? completedAt;

  Todo(
      {required this.title,
      this.completed = false,
      required this.description,
      this.completedAt});

  String get completedAtToString => completed
      ? "${completedAt?.day}/${completedAt?.month}/${completedAt?.year} at ${completedAt?.hour}:${completedAt?.minute}"
      : 'No';

  void onComplete() {
    completed = !completed;
    completed ? completedAt = DateTime.now() : completedAt = null;
  }
}
