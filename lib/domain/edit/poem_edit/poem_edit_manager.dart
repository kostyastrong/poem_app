import 'dart:ui';

import 'package:poem_app/domain/edit/poem_edit/poem_edit_notifier.dart';
import 'package:poem_app/domain/models/poem_model.dart';

class PoemEditManager {
  final PoemEditNotifier poemEditNotifier;

  const PoemEditManager(this.poemEditNotifier);

  void changeAlign(TextAlign newAlign) {
    poemEditNotifier.changeAppearAlign(newAlign);
  }

  bool poemIsCreatedBefore() {
    return poemEditNotifier.state.poemEditIndex != null;
  }

  int? getIndex() {
    return poemEditNotifier.getIndex();
  }

  PoemModel? getPoem() {
    return poemEditNotifier.getCurrentPoem();
  }

  void updatePoemEditIndex(int? index) => poemEditNotifier.updateIndex(index);
}
