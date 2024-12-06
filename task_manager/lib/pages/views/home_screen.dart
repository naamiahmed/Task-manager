import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import '../viewmodels/task_view_model.dart';
import 'task_form.dart';
import 'task_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Consumer<TaskViewModel>(
          builder: (context, viewModel, child) {
            return ListView.builder(
              itemCount: viewModel.tasks.length,
              itemBuilder: (context, index) {
                final task = viewModel.tasks[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GlassmorphismCard(
                    child: // Replace the existing ListTile in HomeScreen with this:
ListTile(
  title: Text(
    task.title,
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
  subtitle: Text(
    task.description,
    style: TextStyle(
      color: Colors.white70,
      fontSize: 14,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  ),
  trailing: IconButton(
    icon: Icon(Icons.delete, color: Colors.white),
    onPressed: () => _showDeleteConfirmationDialog(context, viewModel, task.id),
  ),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDetailScreen(task: task),
      ),
    );
  },
),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskForm(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, TaskViewModel viewModel, int taskId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Task'),
          content: Text('Are you sure you want to delete this task?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                viewModel.deleteTask(taskId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class GlassmorphismCard extends StatelessWidget {
  final Widget child;

  GlassmorphismCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}