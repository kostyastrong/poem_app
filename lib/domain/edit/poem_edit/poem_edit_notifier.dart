import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/edit/poem_edit/poem_edit_state.dart';

class PoemEditNotifier extends StateNotifier<PoemEditState> {
  PoemEditNotifier()
      : super(
          const PoemEditState(),
        ); // could do without params???

  void changeAppearAlign(TextAlign newAlign) {
    state = state.copyWith(align: newAlign);
  }

  int? getIndex() => state.poemEditIndex;

  void updateIndex(int? index) => state = state.copyWith(poemEditIndex: index);
}
