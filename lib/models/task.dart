class Task {
  String id;
  String title;
  DateTime date;
  String priority;
  bool completed;

  Task({
    required this.id,
    required this.title,
    required this.date,
    required this.priority,
    this.completed = false,
  });
}