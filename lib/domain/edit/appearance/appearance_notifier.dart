import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/edit/appearance/appearance_state.dart';

class AppearNotifier extends StateNotifier<AppearState> {
  AppearNotifier()
      : super(
          const AppearState(
            align: TextAlign.left,
          ),
        ); // could do without params???

  void changeAppearAlign(TextAlign newAlign) {
    state = AppearState(align: newAlign);
  }
}
