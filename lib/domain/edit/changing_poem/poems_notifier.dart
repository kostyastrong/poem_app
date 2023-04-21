import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/poem_model.dart';

class PoemsNotifier extends StateNotifier<List<PoemModel>> {
  PoemsNotifier() : super(<PoemModel>[]);

  void updateAllPoems(List<PoemModel> newPoems) {
    state = newPoems;
  }

  void updatePoem(PoemModel newPoem) {
    state[newPoem.index] = newPoem;
  }

  PoemModel getByIndex(int index) {
    return state[index];
  }

  int addPoem(PoemModel poemModel) {
    state.add(poemModel);
    return poemModel.index;
  }

  int length() {
    return state.length;
  }
}
