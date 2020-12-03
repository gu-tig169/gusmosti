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
      itemBuilder: (context, index) => _todoItem(context, widget.list[index]),
      itemCount: widget.list.length,
    );
  }

  Widget _todoItem(
    context,
    Task task,
  ) {
    return ListTile(
        title: Text(task.title, style: TextStyle(fontSize: 20)),
        leading: Checkbox(
          value: task.completed,
          onChanged: (bool checked) async {
            Provider.of<MyState>(context, listen: false)
                .setCheckbox(task, checked);
          },
        ),
        trailing: IconButton(
          onPressed: () {
            Provider.of<MyState>(context, listen: false).removeItem(task);
          },
          icon: Icon(Icons.cancel),
          color: Colors.red[200],
          iconSize: 30,
        ));
  }
}
