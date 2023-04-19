import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'poem_edit_state.freezed.dart';

@freezed
class PoemEditState with _$PoemEditState {
  const factory PoemEditState(
          {int? poemEditIndex, @Default(TextAlign.left) TextAlign align}) =
      _PoemEditState; // null index for a new poem
}
