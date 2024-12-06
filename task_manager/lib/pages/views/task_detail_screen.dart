import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_form.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  TaskDetailScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        backgroundColor: const Color.fromARGB(221, 97, 97, 97),
      ),
      body: Container(
        decoration: BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.black87, Colors.grey.shade800],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Title: ",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: task.title,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Description: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    TextSpan(
                      text: task.description,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Date: ${task.date.toLocal().toString().split(' ')[0]}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskForm(task: task),
                      ),
                    );
                  },
                  child: Text('Update'),
                 style: ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}