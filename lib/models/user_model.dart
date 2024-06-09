import 'package:flutter/material.dart';

class User {
  final String name;
  User(this.name);
}

class UserModel with ChangeNotifier {
  User? _user;
  User? get user => _user;

  Future<void> fetchUser() async {
    // await Future.delayed(const Duration(seconds: 1));
    _user = User('Masha');
    notifyListeners();
  }
}
