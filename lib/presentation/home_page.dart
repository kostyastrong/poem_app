import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/di.dart';
import 'package:poem_app/domain/models/poem_model.dart';
import 'package:poem_app/presentation/lang.dart';
import 'package:poem_app/presentation/styles/texts.dart';

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
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder<List<PoemModel>>(
            stream: ref.read(dbManagerProvider).poems,
            builder: (context, snapshot) => snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.requireData.length,
                    itemBuilder: (context, index) => PoemCell(
                      poem: snapshot.requireData[index].poem,
                      title: snapshot.requireData[index].title,
                    ),
                  )
                : const Text('no data'),
          )),
          ElevatedButton(
              onPressed: () {
                ref
                    .watch(navigation)
                    .pushLogin(); // TODO: read instead of watch?
              },
              child: const Text('Login')),
          ElevatedButton(
              onPressed: () {
                ref.watch(navigation).pushEdit();
              },
              child: const Text('Edit')),
          TextButton(
            onPressed: () => throw Exception(),
            child: const Text("Throw Test Exception"),
          ),
        ],
      ),
    );
  }
}

class PoemCell extends StatelessWidget {
  const PoemCell({Key? key, required this.poem, required this.title})
      : super(key: key);

  final String poem;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                maxLines: 1,
                style: ThemeText.titleCell,
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            poem,
            maxLines: 2,
            style: ThemeText.poemCell,
          )
        ],
      ),
    );
  }
}
