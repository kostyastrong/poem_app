import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poem_app/domain/navigation/named_routes.dart';

import '../edit/changing_poem/poems_notifier.dart';
import '../models/poem_model.dart';
import '../models/user_model.dart';

class DbPoemManager {
  final PoemsNotifier _poemsNotifier;
  User? currentUser;
  FirebaseFirestore? db;

  DbPoemManager(this._poemsNotifier);

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

    _poemsSubscription ??= FirebaseFirestore.instance
        .collection("poems")
        .doc(currentUser?.uid)
        .snapshots()
        .listen((snapshot) {
      final userModel = UserModel.fromDocumentSnapshot(snapshot, null);
      _poemsNotifier.updatePoems(userModel.poems);
    });
  }

  Future<void> addPoem(PoemModel poem) async {
    if (!_isLogin()) {
      return;
    }
    logger.i("Add poem to user");

    throw Exception("adding is not defined");
  }

  Future<void> addPoemDefPoem() async {
    await addPoem(mockPoemModel);
  }

  void dispose() {
    _poemsSubscription?.cancel();
    _poemsSubscription = null;
  }
}
