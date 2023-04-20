import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final l10nStateHolderProvider = StateNotifierProvider<L10nStateHolder, Locale>(
  (ref) => L10nStateHolder(),
);

class L10nStateHolder extends StateNotifier<Locale> {
  L10nStateHolder() : super(const Locale('ru'));

  void setLocale({required Locale locale}) => state = locale;
}
