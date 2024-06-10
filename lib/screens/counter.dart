import 'package:fl_test/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/counter_model.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // access different provider
    var userProvider = context.watch<UserModel>();
    print(userProvider.user?.name);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IncrementButton<CounterModel1>(),
              CounterView<CounterModel1>(),
              DecrementButton<CounterModel1>(),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IncrementButton<CounterModel2>(),
              CounterView<CounterModel2>(),
              DecrementButton<CounterModel2>(),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Home'))
        ],
      )),
    );
  }
}

class CounterView<T extends Counter> extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    // var counter = Provider.of<CounterModel>(context);
    var counter = context.watch<T>();
    var currentCount = counter.count;
    print(currentCount);

    return Text(
      '$currentCount',
      style: const TextStyle(color: Color(0xffb74093)),
    );
  }
}

class IncrementButton<T extends Counter> extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    // В этом случае нет необходимости прослушивать изменения, поэтому мы устанавливаем значение false в listen.
    // var counter = Provider.of<CounterModel>(context, listen: false);
    var counter = context.read<T>();

    return IconButton(
      icon: const Icon(Icons.add, size: 12),
      onPressed: () {
        counter.increment();
      },
    );
  }
}

class DecrementButton<T extends Counter> extends StatelessWidget {
  const DecrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    // В этом случае нет необходимости прослушивать изменения
    // var counter = Provider.of<CounterModel>(context, listen: false);
    var counter = context.read<T>();

    return IconButton(
      icon: const Icon(Icons.remove, size: 12),
      onPressed: () {
        counter.decrement();
      },
    );
  }
}
