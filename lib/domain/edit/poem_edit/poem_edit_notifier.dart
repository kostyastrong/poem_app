import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/db/db_manager.dart';
import 'package:poem_app/domain/edit/poem_edit/poem_edit_state.dart';
import 'package:poem_app/domain/models/poem_model.dart';
import 'package:poem_app/domain/navigation/named_routes.dart';

class PoemEditNotifier extends StateNotifier<PoemEditState> {
  PoemEditNotifier(this.dbManager)
      : super(
          const PoemEditState(),
        ) {
    logger.i("build of editNotifier");
  }

  final DbPoemsManager dbManager;

  void changeAppearAlign(TextAlign newAlign) {
    state = state.copyWith(align: newAlign);
  }

  int? getIndex() => state.poemEditIndex;
  PoemModel? getCurrentPoem() =>
      getIndex() != null ? dbManager.getPoemByIndex(getIndex()!) : null;

  void updateIndex(int? index) => state = state.copyWith(poemEditIndex: index);
}
