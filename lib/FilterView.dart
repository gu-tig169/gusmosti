import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoApp/ToDoList.dart';
import 'package:todoApp/model.dart';

class AllTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<MyState>(
            builder: (context, task, child) => ToDoList(list: task.allTasks)));
  }
}

class CompletedTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<MyState>(
        builder: (context, task, child) => ToDoList(
          list: task.completedTasks,
        ),
      ),
    );
  }
}

class IncompleteTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<MyState>(
        builder: (context, task, child) => ToDoList(
          list: task.incompleteTasks,
        ),
      ),
    );
  }
}
