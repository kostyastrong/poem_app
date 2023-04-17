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
          const Text('el1'),
          const Text('el2'),
          const Text('el3'),
          ElevatedButton(
              onPressed: () {
                ref.watch(navigation).pushLogin();
              },
              child: const Text('Login'),),
          ElevatedButton(
              onPressed: () {
                ref.watch(navigation).pushEdit();
              },
              child: const Text('Edit'),),
        ],
      ),
    );
  }
}
