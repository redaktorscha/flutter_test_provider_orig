import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/counter_model.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              IncrementButton(),
              CounterView(),
              DecrementButton(),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IncrementButton(),
              CounterView(),
              DecrementButton(),
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
