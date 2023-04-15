import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/theme/theme_state_holder.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeManagerProvider = Provider(
      (ref) =>
  ThemeManager(
    ref.watch(themeStateHolderProvider.notifier),
  )
    ..init(),
);

class ThemeManager {
  final ThemeStateHolder _stateHolder;
  late final SharedPreferences _sharedPreferences;

  static const _themeKey = 'theme';

  ThemeManager(this._stateHolder);

  ThemeEnum get _theme {
    if (_sharedPreferences.containsKey(_themeKey)) {
      final theme = _sharedPreferences.getString(_themeKey);
      return ThemeEnum.values.firstWhere((name) => name.name == theme);
    }
    return ThemeEnum.light;
  }

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _stateHolder.setTheme(
      value: _theme,
    );
  }

  void updateSetting() {
    final theme = _theme == ThemeEnum.dark ? ThemeEnum.light : ThemeEnum.dark;

    _sharedPreferences.setString(_themeKey, theme.name);
    _stateHolder.setTheme(value: theme);
  }
}