import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/di.dart';
import 'package:poem_app/presentation/lang.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Lang.of(context).appTitle),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              ref.watch(navigation).pushLogin();
            },
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.watch(navigation).pushEdit();
            },
            child: const Text('Edit'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.watch(navigation).pushSettings();
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
