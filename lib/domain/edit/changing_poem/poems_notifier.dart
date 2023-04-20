import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/poem_model.dart';

class PoemsNotifier extends StateNotifier<List<PoemModel>> {
  PoemsNotifier() : super(<PoemModel>[]);

  void updatePoems(List<PoemModel> newPoems) {
    state = newPoems;
  }
}
