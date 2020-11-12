import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'TIG169 TODO',
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
          ),
        ],
      ),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 56),
        backgroundColor: Colors.grey,
      ),
    );
  }

  Widget _list() {
    var todos = [
      'Plugga',
      'Städa',
      'Laga mat',
      'Träna',
      'Handla',
      'Test1',
      'Test2',
    ];

    var list = List.generate(1000, (index) => '${todos[index % 7]}');

    return ListView.builder(
      itemBuilder: (context, index) => _item(list[index]),
      itemCount: 7,
    );
  }

  Widget _item(text) {
    return CheckboxListTile(
      title: Text(text,
          style: TextStyle(
            fontSize: 26,
          )),
      secondary: Icon(Icons.cancel),
      value: false,
      onChanged: (val) {},
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'TIG169 TODO',
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 24,
            ),
            _nameInputField(),
            Container(
              height: 40,
            ),
            _iconRow(),
          ],
        ),
      ),
    );
  }
}

Widget _nameInputField() {
  return Container(
    margin: EdgeInsets.only(left: 16, top: 40),
    child: TextField(
      decoration: InputDecoration(hintText: 'What are you going to do?'),
    ),
  );
}

Widget _iconRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        child: Icon(Icons.add),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('ADD', style: TextStyle(fontSize: 16)),
        ],
      ),
    ],
  );
}

Widget _buttonAdd() {
  return RaisedButton(
    onPressed: () {},
    color: Colors.white,
    // text: Text('+ ADD'),
    // child: Row(
    //  children: [
    //    Container(
    //      padding: EdgeInsets.only(left: 16, top: 40), child: Icon(Icons.add))
  );
}
