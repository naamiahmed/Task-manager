import 'package:flutter/material.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';

class TaskViewModel with ChangeNotifier {
  final TaskRepository _taskRepository = TaskRepository();
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  TaskViewModel() {
    loadTasks();
  }

  int getNextId() {
    if (_tasks.isEmpty) return 1;
    return _tasks.map((task) => task.id).reduce((max, id) => id > max ? id : max) + 1;
  }

  Future<void> loadTasks() async {
    try {
      _tasks = await _taskRepository.getTasks();
      notifyListeners();
    } catch (e) {
      print('Error loading tasks: $e');
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await _taskRepository.insertTask(task);
      await loadTasks();
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _taskRepository.updateTask(task);
      await loadTasks();
    } catch (e) {
      print('Error updating task: $e');
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await _taskRepository.deleteTask(id);
      await loadTasks();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }

  Future<void> toggleTaskCompletion(int id, bool isCompleted) async {
    try {
      final task = _tasks.firstWhere((task) => task.id == id);
      task.isCompleted = isCompleted;
      await _taskRepository.updateTask(task);
      await loadTasks();
    } catch (e) {
      print('Error toggling task completion: $e');
    }
  }
}