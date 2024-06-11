import 'package:flutter/material.dart';

class Todo {
  final String id;
  final String title;
  bool completed;

  Todo({required this.id, required this.title, this.completed = false});
}

class TodoModel with ChangeNotifier {
  List<Todo> todos = [];

  void add(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  void delete(String id) {
    todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void toggleStatus(String id) {
    final todo = todos.firstWhere((todo) => todo.id == id);
    todo.completed = !todo.completed;
    notifyListeners();
  }
}
