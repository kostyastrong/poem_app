import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/di.dart';
import 'package:poem_app/domain/navigation/named_routes.dart';

import '../models/poem_model.dart';

class dbManager {
  dbManager();

  static final mockPoemModel = PoemModel(index: 0,
      title: 'Be',
      poem: "Be the dream to everybody, Be as your most thoughtful film, Be the hero, be the fighter, Be the one you've always been.",
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
          .where('uid', isEqualTo: currentUser.uid)
          .get()
          .then((value) {
        logger.i(value.docs.toString());
      }); // subclass of document snapshot
    } on Exception {
      logger.i("can't show poems thing");
    }
  }

  Future<void> addPoem(PoemModel poemModel) async {
    final db = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }

    final docRef = db
        .collection("poems")
        .withConverter(
      fromFirestore: PoemModel.fromDocumentSnapshot,
      toFirestore: (PoemModel, options) => PoemModel.toFirestore(),
    )
        .doc(currentUser.uid);
    await docRef.set(List<PoemModel>[dbManager.mockPoemModel])
  }
}
