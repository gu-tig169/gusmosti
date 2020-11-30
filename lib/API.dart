import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todoApp/model.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '3e885eb2-db35-46dd-8a2d-ff2cd597d58d';

class API {
  static Future addTodos(Task task) async {
    print(task);
    var json = jsonEncode(Task.toJson(task));
    print(json);
    await http.post('$API_URL/todos?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
    print('done');
  }

  static Future updateTodos(Task task) async {
    var json = jsonEncode(Task.toJson(task));
    await http.put('$API_URL/todos/$id?key=$API_KEY',
        body: json); // inte färdig med post än
  }

  static Future deleteTodos(String id) async {
    await http.delete('$API_URL/todos/$id?key=$API_KEY');
  }

  static Future<List<Task>> getTodos() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    String bodyString = response.body;
    print(response.body);
    var json = jsonDecode(bodyString);
    print(json);
    return json.map<Task>((data) {
      return Task.fromJson(data);
    }).toList();
  }
}
