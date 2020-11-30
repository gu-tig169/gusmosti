import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todoApp/API.dart';

class Task {
  String title;
  bool done;
  String id;

  Task({
    this.title,
    this.done = false,
    this.id,
  });

  void toggleCompleted() {
    if (done == true) {
      done = false;
    } else {
      done = true;
    }
  }

  static Map<String, dynamic> toJson(Task task) {
    return {
      'title': task.title,
      'done': task.done,
      'id': task.id,
    };
  }

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      done: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<Task> _list = [];

  String _filterBy = "All";

  List<Task> get list => _list;

  String get filterBy => _filterBy;

  /*UnmodifiableListView<Task> get filteredTasks {
    if (_filterBy == 'All') return allTasks;
  }*/

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_list);
  UnmodifiableListView<Task> get incompleteTasks =>
      UnmodifiableListView(_list.where((task) => !task.done));
  UnmodifiableListView<Task> get completedTasks =>
      UnmodifiableListView(_list.where((task) => task.done));

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

  void changeState(Task task) {
    final taskIndex = _list.indexOf(task);
    _list[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
