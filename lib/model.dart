import 'dart:collection';

import 'package:flutter/material.dart';

class Task {
  String text;
  bool completed;

  Task({
    this.text,
    this.completed = false,
  });

  void completedTask() {
    completed = !completed;
  }
}

class MyState extends ChangeNotifier {
  List<Task> _list = [];

  String filterSetting = "All";

  List<Task> get list => _list;

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_list);

  UnmodifiableListView<Task> get incompleteTasks =>
      UnmodifiableListView(_list.where((task) => !task.completed));

  UnmodifiableListView<Task> get completedTasks =>
      UnmodifiableListView(_list.where((task) => task.completed));

  void addItem(String text) {
    _list.add(Task(text: text));
    notifyListeners();
  }

  void removeItem(int index) {
    _list.removeAt(index);
    notifyListeners();
  }

  void changeState(Task task) {
    final taskIndex = _list.indexOf(task);
    _list[taskIndex].completedTask();
    notifyListeners();
  }

  void filterView(String filterSetting) {
    notifyListeners();
  }
}
