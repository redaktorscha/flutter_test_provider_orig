import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class CounterModel extends ChangeNotifier {
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

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterModel>(
          create: (context) => CounterModel(),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Provider Counter Demo'),
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IncrementButton(),
                DecrementButton(),
                CounterView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    // var counter = Provider.of<CounterModel>(context);
    var counter = context.watch<CounterModel>();
    var currentCount = counter.count;
    print(currentCount);

    return Text(
      '$currentCount',
      style: const TextStyle(color: Colors.green),
    );
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    // В этом случае нет необходимости прослушивать изменения, поэтому мы устанавливаем значение false в listen.
    // var counter = Provider.of<CounterModel>(context, listen: false);
    var counter = context.read<CounterModel>();

    return IconButton(
      icon: const Icon(Icons.add, size: 12),
      onPressed: () {
        counter.increment();
      },
    );
  }
}

class DecrementButton extends StatelessWidget {
  const DecrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    // В этом случае нет необходимости прослушивать изменения
    // var counter = Provider.of<CounterModel>(context, listen: false);
    var counter = context.read<CounterModel>();

    return IconButton(
      icon: const Icon(Icons.remove, size: 12),
      onPressed: () {
        counter.decrement();
      },
    );
  }
}
