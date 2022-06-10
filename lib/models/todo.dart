class Todo {
  String title;
  bool completed;
  String description;
  DateTime? completedAt;

  Todo(
      {required this.title,
      this.completed = false,
      required this.description,
      this.completedAt});

  String get completedAtString => completed
      ? "${completedAt?.day}/${completedAt?.month}/${completedAt?.year} at ${completedAt?.hour}:${completedAt?.minute}"
      : 'No';
}
