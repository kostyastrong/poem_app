import 'package:cloud_firestore/cloud_firestore.dart';

class PoemModel {
  final String title;
  final String poem;
  final int lastEdited;
  final int index;

  PoemModel({
    required this.index,
    required this.title,
    required this.poem,
    required this.lastEdited,
  });

  factory PoemModel.fromDocumentSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return PoemModel(
      title: data?['title'],
      lastEdited: data?['last_edited'],
      poem: data?['poem'],
      index: data?['index'],
    );
  }

  factory PoemModel.fromMap(Map<String, dynamic> data) {
    return PoemModel(
      title: data['title'],
      lastEdited: data['last_edited'],
      poem: data['poem'],
      index: data['index'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (title != null) "title": title,
      if (poem != null) "poem": poem,
      if (lastEdited != null) "last_edited": lastEdited,
      if (index != null) "index": index,
    };
  }
}
