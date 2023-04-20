import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/di.dart';
import 'package:poem_app/domain/navigation/named_routes.dart';

import '../edit/changing_poem/poems_notifier.dart';
import '../models/poem_model.dart';
import '../models/user_model.dart';

class DbPoemsManager {
  final PoemsNotifier _poemsNotifier;
  User? currentUser;
  FirebaseFirestore? db;

  TextEditingController? poemFieldController;
  TextEditingController? titleFieldController;

  DbPoemsManager(this._poemsNotifier);

  StreamSubscription? _poemsSubscription;

  void updateLogin() {
    currentUser = FirebaseAuth.instance.currentUser;
    db ??= FirebaseFirestore.instance;
  }

  bool _isLogin() {
    updateLogin();
    return currentUser != null;
  }

  static final mockPoemModel = PoemModel(
    index: 0,
    title: 'Be',
    poem:
    "Be the dream to everybody,\n Be as your most thoughtful film,\n Be the hero, be the fighter,\n Be the one you've always been.",
    lastEdited: 666,
  );

  Future<void> init() async {
    if (!_isLogin()) {
      return;
    }


    poemFieldController ??= TextEditingController();
    titleFieldController ??= TextEditingController();

    _poemsSubscription ??= FirebaseFirestore.instance
        .collection("poems")
        .doc(currentUser?.uid)
        .snapshots()
        .listen((snapshot) {
      final userModel = UserModel.fromDocumentSnapshot(snapshot, null);
      _poemsNotifier.updateAllPoems(userModel.poems);
    });
  }



  Future<void> addPoem(PoemModel poem) async {
    if (!_isLogin()) {
      return;
    }
    db
        ?.collection('poems')
        .doc(currentUser!.uid)
        .collection('poems')
        .add(poem.toJson());
    logger.i("Poem's been added to DB");
  }

  PoemModel getPoemByIndex(int index) {
    return _poemsNotifier.state[index];
  }


  void updatePoemList(PoemModel newVersion) {
    _poemsNotifier.updatePoem(newVersion);
    db
        ?.collection('poems')
        .doc(currentUser!.uid)
        .collection('poems')
        .doc("${newVersion.index}")
        .set(newVersion.toJson());
  }

  void updateFirebasePoem(PoemModel newPoem) {
    updatePoemList(newPoem);
    updateLogin();
    DatabaseReference poemRef =
    FirebaseDatabase.instance.ref("poems/${currentUser}/${newPoem.index}");
    poemRef.set(newPoem.toJson());
  }

  void updatePoemListener() {
    final newTitleText = titleFieldController!.text;
    final newPoemText = poemFieldController!.text;
  }

  int addEmptyPoem() {
    _poemsNotifier.state.add(PoemModel(
        index: _poemsNotifier.state.length,
        lastEdited: DateTime
            .now()
            .millisecondsSinceEpoch));
    return _poemsNotifier.state.length - 1;
  }

  Future<void> addPoemDefPoem() async {
    await addPoem(mockPoemModel);
  }

  void dispose() {
    _poemsSubscription?.cancel();
    poemFieldController?.dispose();
    titleFieldController?.dispose();
    poemFieldController = null;
    titleFieldController = null;
    _poemsSubscription = null;
  }
}
