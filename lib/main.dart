import 'package:fl_test/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/counter_model.dart';
import './models/user_model.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CounterModel1>(
      create: (context) => CounterModel1(),
    ),
    ChangeNotifierProvider<CounterModel2>(
      create: (context) => CounterModel2(),
    ),
    ChangeNotifierProvider<UserModel>(
      create: (context) => UserModel(),
    ),
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Provider demo',
      home: HomeScreen(),
    );
  }
}
