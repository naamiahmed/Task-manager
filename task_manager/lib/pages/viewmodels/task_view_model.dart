import 'package:flutter/material.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';

class TaskViewModel with ChangeNotifier {
  final TaskRepository _taskRepository = TaskRepository();
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  void loadTasks() async {
    try {
      _tasks = await _taskRepository.getTasks();
      notifyListeners();
    } catch (e) {
      print('Error loading tasks: $e');
    }
  }

  void addTask(Task task) async {
    try {
      await _taskRepository.insertTask(task);
      loadTasks(); // Reload the tasks after adding
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  void updateTask(Task task) async {
    try {
      await _taskRepository.updateTask(task);
      loadTasks(); // Reload the tasks after updating
    } catch (e) {
      print('Error updating task: $e');
    }
  }

  void deleteTask(int id) async {
    try {
      await _taskRepository.deleteTask(id);
      loadTasks(); // Reload the tasks after deleting
    } catch (e) {
      print('Error deleting task: $e');
    }
  }
}