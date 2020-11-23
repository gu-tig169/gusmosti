import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class ToDoList extends StatefulWidget {
  final List<Task> list;

  ToDoList({this.list});

  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          _item(context, widget.list[index], index),
      itemCount: widget.list.length,
    );
  }

  Widget _item(
    context,
    Task task,
    index,
  ) {
    return ListTile(
        title: Text(task.text, style: TextStyle(fontSize: 20)),
        leading: Checkbox(
          value: task.completed,
          onChanged: (bool checked) {
            Provider.of<MyState>(context, listen: false).changeState(task);
          },
        ),
        trailing: IconButton(
          onPressed: () {
            Provider.of<MyState>(context, listen: false).removeItem(index);
          },
          icon: Icon(Icons.cancel),
        ));
  }
}
