import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeStateHolderProvider =
    StateNotifierProvider<ThemeStateHolder, ThemeEnum>(
  (ref) => ThemeStateHolder(),
);

class ThemeStateHolder extends StateNotifier<ThemeEnum> {
  ThemeStateHolder() : super(ThemeEnum.light);

  void setTheme({required ThemeEnum value}) => state = value;
}

enum ThemeEnum {
  dark,
  light;

  bool toBool() {
    switch (this) {
      case ThemeEnum.dark:
        return true;
      case ThemeEnum.light:
        return false;
    }
  }
}
