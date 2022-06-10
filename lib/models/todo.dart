class Todo {
  String title;
  bool completed;
  String description;
  DateTime? completedAt;

  Todo(
      {required this.title, this.completed = false, required this.description});
}
