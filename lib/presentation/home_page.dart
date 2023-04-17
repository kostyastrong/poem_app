import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/di.dart';
import 'package:poem_app/presentation/lang.dart';

import '../domain/navigation/named_routes.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (FirebaseAuth.instance.currentUser == null) {
      logger.i("Home page build, user isn't signed in");
    } else {
      logger.i("Home page build, user is ${FirebaseAuth.instance.currentUser}");
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(Lang.of(context).appTitle),
      ),
      body: ListView(
        children: [
          Text('el1'),
          Text('el2'),
          Text('el3'),
          ElevatedButton(
              onPressed: () {
                ref.watch(navigation).pushLogin();  // TODO: read instead of watch?
              },
              child: Text('Login')),
          ElevatedButton(
              onPressed: () {
                ref.watch(navigation).pushEdit();
              },
              child: Text('Edit')),
        ],
      ),
    );
  }
}
