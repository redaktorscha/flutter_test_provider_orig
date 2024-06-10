import 'package:flutter/material.dart';

abstract class Counter {
  final _count = 0;

  int get count => _count;

  void increment() {}

  void decrement() {}
}

class CounterModel1 with ChangeNotifier implements Counter {
  @override
  int _count = 0;

  @override
  int get count => _count;

  @override
  void increment() {
    _count += 1;
    notifyListeners(); // Уведомить все виджеты, прослушивающие данную модель.
  }

  @override
  void decrement() {
    _count -= 1;
    notifyListeners(); // Уведомить все виджеты, прослушивающие данную модель.
  }
}

class CounterModel2 with ChangeNotifier implements Counter {
  @override
  int _count = 0;

  @override
  int get count => _count;

  @override
  void increment() {
    _count += 1;
    notifyListeners(); // Уведомить все виджеты, прослушивающие данную модель.
  }

  @override
  void decrement() {
    _count -= 1;
    notifyListeners(); // Уведомить все виджеты, прослушивающие данную модель.
  }
}
