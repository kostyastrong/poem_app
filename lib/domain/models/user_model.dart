import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poem_app/domain/navigation/named_routes.dart';

import '../models/poem_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final List<PoemModel> poems;

  const UserModel({required this.poems});

  factory UserModel.fromDocumentSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    logger.w(snapshot.data()?['poems']['poems']);
    final data =
        List<Map<String, dynamic>>.from(snapshot.data()?['poems']['poems']);
    List<PoemModel> poemsTemp = [];
    for (var poem in data) {
      poemsTemp.add(PoemModel.fromJson(poem));
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
      poemsTemp.add(PoemModel.fromJson(poem));
    }
    return UserModel(poems: poemsTemp);
  }

  Map<String, dynamic> toFirestore() {
    List<Map<String, dynamic>> poemsList = [];
    for (final i in poems) {
      poemsList.add(i.toJson());
    }

    Map<String, dynamic> poemsCopy = {
      'poems': poemsList,
    };
    return poemsCopy;
  }
}
