import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poem_app/domain/navigation/named_routes.dart';

import '../models/poem_model.dart';
import '../models/user_model.dart';

class dbManager {
  dbManager();

  static final mockPoemModel = PoemModel(
      index: 0,
      title: 'Be',
      poem:
          "Be the dream to everybody, Be as your most thoughtful film, Be the hero, be the fighter, Be the one you've always been.",
      lastEdited: 666);

  void poemStream() {
    // Stream<List<PoemModel>>
    final db = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }
    try {
      db
          .collection("poems")
          .doc(currentUser.uid)
          .get()
          .then((value) {
        logger.i(value.data().toString());
      }); // subclass of document snapshot
    } on Exception {
      logger.i("can't show poems thing");
    }
  }

  static Future<void> addPoemDefPoem() async {
    final db = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }
    logger.i("I will add a poem to user");

    final docRef = db
        .collection("poems")
        .withConverter(
          fromFirestore: UserModel.fromDocumentSnapshot,
          toFirestore: (UserModel, options) => UserModel.toFirestore(),
        )
        .doc(currentUser.uid);
    await docRef.set(UserModel(poems: [mockPoemModel]));
    logger.i('Def Poem Added');
  }
}
