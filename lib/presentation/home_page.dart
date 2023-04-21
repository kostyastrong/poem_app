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

    ref.read(dbPoemsManagerProvider);
    final allPoemsState = ref.watch(poemsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(Lang.of(context).appTitle),
      ),
      body: Column(
        children: [
          Expanded(
            child: allPoemsState.isNotEmpty
                ? ListView.builder(
                    itemCount: allPoemsState.length,
                    itemBuilder: (context, index) => PoemCell(
                      poemModel: allPoemsState[index],
                    ),
                  )
                : const Text('no data, sign in'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(navigationProvider).pushLogin();
            },
            child: Text(Lang.of(context).login),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(poemEditManager).updatePoemEditIndex(null);
              ref.read(navigationProvider).pushEdit();
            },
            child: Text(Lang.of(context).edit),
          ),
          ElevatedButton(
            onPressed: () {
              ref.watch(navigationProvider).pushSettings();
            },
            child: Text(Lang.of(context).settings),
          ),
        ],
      ),
    );
  }
}

class PoemCell extends ConsumerWidget {
  const PoemCell({Key? key, required this.poemModel}) : super(key: key);

  final PoemModel poemModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(poemEditManager).updatePoemEditIndex(poemModel.index);
        ref.read(navigationProvider).pushEdit();
      },
      child: Padding(
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
                  poemModel.title,
                  maxLines: 1,
                  style: ThemeText.titleCell,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              poemModel.poem,
              maxLines: 2,
              style: ThemeText.poemCell,
            )
          ],
        ),
      ),
    );
  }
}
