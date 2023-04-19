// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoemModel _$PoemModelFromJson(Map<String, dynamic> json) => PoemModel(
      index: json['index'] as int,
      title: json['title'] as String,
      poem: json['poem'] as String,
      lastEdited: json['lastEdited'] as int,
    );

Map<String, dynamic> _$PoemModelToJson(PoemModel instance) => <String, dynamic>{
      'title': instance.title,
      'poem': instance.poem,
      'lastEdited': instance.lastEdited,
      'index': instance.index,
    };
