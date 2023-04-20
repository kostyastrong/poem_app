import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poem_model.g.dart';

@JsonSerializable()
class PoemModel {
  final String title;
  final String poem;
  final int lastEdited;
  final int index;  // index in db

  PoemModel({
    required this.index,
    this.title = "",
    this.poem = "",
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

  // TODO: fails when trying to do with json_serializable
  factory PoemModel.fromJson(Map<String, dynamic> data) {
    return PoemModel(
      title: data['title'],
      lastEdited: data['last_edited'],
      poem: data['poem'],
      index: data['index'],
    );
  }

  // factory PoemModel.fromJson(Map<String, dynamic> data) =>
  //     _$PoemModelFromJson(data);

  Map<String, dynamic> toJson() => _$PoemModelToJson(this);
}
