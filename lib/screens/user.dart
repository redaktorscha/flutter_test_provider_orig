import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = context.watch<UserModel>();
    var text = userProvider.user == null
        ? 'No username'
        : 'User: ${userProvider.user?.name}';
    return Scaffold(
      appBar: AppBar(
        title: const Text('User screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Home'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Provider.of<UserModel>(context, listen: false).fetchUser();
          },
          child: const Icon(Icons.download)),
    );
  }
}
