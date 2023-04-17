import 'package:poem_app/domain/db/db_manager.dart';

import '../models/poem_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel{
  final List<PoemModel> poems;

  UserModel({required this.poems});
  
  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return UserModel(
      poems: data?['poems'],
    );
  }

  Map<String, dynamic> toFirestore() {
    Map<String, dynamic> poemsCopy = {
      'poems':[],
    };
    for (final i in poems) {
      poemsCopy['poems'].add(i.toFirestore());
    }
    poemsCopy['poems'].add(dbManager.mockPoemModel.toFirestore());
    return {
      if (poems != null) "poems": poemsCopy,
    };
  }
}