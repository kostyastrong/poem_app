// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PoemModel _$$_PoemModelFromJson(Map<String, dynamic> json) => _$_PoemModel(
      index: json['index'] as int,
      title: json['title'] as String? ?? "",
      poem: json['poem'] as String? ?? "",
      lastEdited: json['lastEdited'] as int,
    );

Map<String, dynamic> _$$_PoemModelToJson(_$_PoemModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'title': instance.title,
      'poem': instance.poem,
      'lastEdited': instance.lastEdited,
    };
