// lib/pages/models/task.dart

class Task {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  bool _isCompleted = false;  // private field with default value

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    bool isCompleted = false,
  }) : _isCompleted = isCompleted;

  // Getter with proper bool return type
  bool get isCompleted => _isCompleted;

  // Setter with bool parameter
  set isCompleted(bool value) {
    _isCompleted = value;
  }

  // If you need to convert to/from JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }
}