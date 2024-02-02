import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist_app/data/model/todolist_model.dart';

class ToDoListRepo {
  static Future<List<TodoListModel>> getToDoList() async {
    String endpoint = 'http://localhost:9600/api/todolist';
    try {
      var response = await http.get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<TodoListModel> todoList =
            jsonData.map((json) => TodoListModel.fromJson(json)).toList();

        return todoList;
      }
    } catch (e) {
      throw Exception('Network error occurred');
    }
    return [];
  }
}
