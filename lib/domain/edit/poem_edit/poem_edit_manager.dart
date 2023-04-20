import 'dart:ui';

import 'package:poem_app/domain/edit/poem_edit/poem_edit_notifier.dart';

class PoemEditManager {
  final PoemEditNotifier poemEditNotifier;

  const PoemEditManager(this.poemEditNotifier);

  void changeAlign(TextAlign newAlign) {
    poemEditNotifier.changeAppearAlign(newAlign);
  }

  bool poemIsCreatedBefore() {
    return poemEditNotifier.getIndex() != null;
  }

  void updatePoemEditIndex(int? index) => poemEditNotifier.updateIndex(index);
}
