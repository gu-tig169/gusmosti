import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todoApp/API.dart';

class Task {
  String title;
  bool completed;
  String id;

  Task({
    this.title,
    this.completed = false,
    this.id,
  });

  void toggleCompleted() {
    if (completed == true) {
      completed = false;
    } else {
      completed = true;
    }
  }

  static Map<String, dynamic> toJson(Task task) {
    return {
      'title': task.title,
      'done': task.completed,
      'id': task.id,
    };
  }

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      completed: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<Task> _list = [];

  String _filterBy = "All";

  List<Task> get list => _list;

  String get filterBy => _filterBy;

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_list);
  UnmodifiableListView<Task> get incompleteTasks =>
      UnmodifiableListView(_list.where((task) => !task.completed));
  UnmodifiableListView<Task> get completedTasks =>
      UnmodifiableListView(_list.where((task) => task.completed));

  Future getTodos() async {
    List<Task> list = await API.getTodos();
    _list = list;
    notifyListeners();
  }

  void addItem(Task task) async {
    await API.addTodos(task);
    await getTodos();
    notifyListeners();
  }

  void removeItem(Task task) async {
    await API.deleteTodos(task.id);
    await getTodos();
  }

  void setCheckbox(Task task, bool done) async {
    task.completed = done;
    await API.updateTodos(task, task.id);
    await getTodos();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
