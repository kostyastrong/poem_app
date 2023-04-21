import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../navigation/named_routes.dart';

part 'poem_model.freezed.dart';
part 'poem_model.g.dart';

@freezed
class PoemModel with _$PoemModel {
  factory PoemModel({
    required int index,  // index in db
    @Default("") String title,
    @Default("") String poem,
    required int lastEdited,
  }) = _PoemModel;

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

  // TODO: fails when trying to do with json_serializable and no copyWith
  factory PoemModel.fromJson(Map<String, dynamic> json) {
    logger.i(json.toString());
    return PoemModel(
      title: json['title'],
      lastEdited: json['last_edited'],
      poem: json['poem'],
      index: json['index'],
    );
    // return _$PoemModelFromJson(json);
  }

  // factory PoemModel.fromJson(Map<String, dynamic> data) =>
  //     _$PoemModelFromJson(data);

  // Map<String, dynamic> toJson() => _$PoemModelToJson(this);
}
