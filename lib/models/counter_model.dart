import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count += 1;
    notifyListeners(); // Уведомить все виджеты, прослушивающие данную модель.
  }

  void decrement() {
    _count -= 1;
    notifyListeners(); // Уведомить все виджеты, прослушивающие данную модель.
  }
}
