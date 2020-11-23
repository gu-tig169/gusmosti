import 'package:flutter/material.dart';
import 'package:todoApp/FilterView.dart';
import 'package:todoApp/SecondView.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'ToDoList.dart';

void main() {
  var state = MyState();

  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

//nytt
class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Colors.grey),
        title: Text('TIG169 TODO',
            style: TextStyle(color: Colors.black, fontSize: 26)),
        actions: <Widget>[
          _filterView(),
        ],
      ),
      body: Center(
        child: _list(context),
      ),
      floatingActionButton: _fab(context),
    );
  }

  Widget _list(context) {
    var filter = Provider.of<MyState>(context, listen: false).filterSetting;

    if (filter == "All") {
      return AllTasksTab();
    }

    if (filter == "Done") {
      return CompletedTasksTab();
    }

    if (filter == "Undone") {
      return IncompleteTasksTab();
    }
  }

  Widget _fab(context) {
    return FloatingActionButton(
      child: Icon(Icons.add, size: 56),
      backgroundColor: Colors.grey,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondView()));
      },
    );
  }

  Widget _filterView() {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        size: 30.0,
        color: Colors.black54,
      ),
      color: Colors.white,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: "1",
          child: Text("All"),
        ),
        PopupMenuItem<String>(
          value: "2",
          child: Text("Done"),
        ),
        PopupMenuItem<String>(
          value: "3",
          child: Text("Undone"),
        )
      ],
    );
  }
}
