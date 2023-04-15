import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'theme_data.freezed.dart';

@freezed
class MyThemeData with _$MyThemeData {
  const factory MyThemeData({required Color buttonTextColor}) = _MyThemeData;
}