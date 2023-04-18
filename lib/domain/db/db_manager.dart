import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poem_app/domain/navigation/named_routes.dart';

import '../models/poem_model.dart';
import '../models/user_model.dart';

class dbPoemManager {
  dbPoemManager();

  User? currentUser;
  FirebaseFirestore? db;

  Stream<List<PoemModel>> get poems => poemController.stream;

  late final StreamSubscription _poemSubscribtion;
  final StreamController<List<PoemModel>> poemController =
      StreamController.broadcast();

  void updateLogin() {
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      db = FirebaseFirestore.instance;
    }
  }

  bool isLogin() {
    updateLogin();
    if (currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  static final mockPoemModel = PoemModel(
      index: 0,
      title: 'Be',
      poem:
          "Be the dream to everybody,\n Be as your most thoughtful film,\n Be the hero, be the fighter,\n Be the one you've always been.",
      lastEdited: 666);

  Future<void> initSubscribtion() async {
    if (!isLogin()) {
      return;
    }
    _poemSubscribtion = FirebaseFirestore.instance
        .collection("poems")
        .doc(currentUser?.uid)
        .snapshots()
        .listen((snapshot) {
      final userModel = UserModel.fromDocumentSnapshot(snapshot, null);
      poemController.add(userModel.poems);
    });
  }

  Future<void> addPoem(PoemModel poem) async {
    if (!isLogin()) {
      return;
    }
    logger.i("Add poem to user");

    // final docRef = FirebaseFirestore.instance
    //     .collection("poems")
    //     .withConverter(
    //       fromFirestore: UserModel.fromDocumentSnapshot,
    //       toFirestore: (UserModel, options) => UserModel.toFirestore(),
    //     )
    //     .doc(currentUser?.uid);
    // await docRef.set(UserModel(poems: [mockPoemModel]));
    logger.i('Def Poem Added');
  }

  Future<void> addPoemDefPoem() async {
    await addPoem(mockPoemModel);
  }
}
