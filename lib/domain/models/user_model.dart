import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poem_app/domain/db/db_manager.dart';
import 'package:poem_app/domain/navigation/named_routes.dart';

import '../models/poem_model.dart';

class UserModel {
  final List<PoemModel> poems;

  UserModel({required this.poems});

  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    logger.w(snapshot.data()?['poems']['poems']);
    final data =
        List<Map<String, dynamic>>.from(snapshot.data()?['poems']['poems']);
    List<PoemModel> poemsTemp = [];
    for (var poem in data) {
      poemsTemp.add(PoemModel.fromMap(poem));
    }
    poemsTemp.sort((a, b) => a.lastEdited.compareTo(b.lastEdited));
    return UserModel(poems: poemsTemp);
  }

  factory UserModel.fromMap(
    Map<String, List<Map<String, dynamic>>> map,
  ) {
    final data = map['poems'];
    List<PoemModel> poemsTemp = [];
    for (var poem in data!) {
      poemsTemp.add(PoemModel.fromMap(poem));
    }
    return UserModel(poems: poemsTemp);
  }

  Map<String, dynamic> toFirestore() {
    Map<String, dynamic> poemsCopy = {
      'poems': [],
    };
    for (final i in poems) {
      poemsCopy['poems'].add(i.toFirestore());
    }
    poemsCopy['poems'].add(dbPoemManager.mockPoemModel.toFirestore());
    return {
      if (poems != null) "poems": poemsCopy,
    };
  }
}
