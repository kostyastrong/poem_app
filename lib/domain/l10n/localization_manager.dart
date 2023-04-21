import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/l10n/localization_state_holder.dart';
import 'package:poem_app/presentation/lang.dart';
import 'package:shared_preferences/shared_preferences.dart';

final l10nManagerProvider = Provider(
  (ref) => L10nManager(
    ref.watch(l10nStateHolderProvider.notifier),
  )..init(),
);

class L10nManager {
  final L10nStateHolder _stateHolder;
  late final SharedPreferences _sharedPreferences;

  static const _localeKey = 'locale';

  L10nManager(this._stateHolder);

  Locale get _locale {
    if (_sharedPreferences.containsKey(_localeKey)) {
      final locale = _sharedPreferences.getString(_localeKey);
      return locale == Lang.en.languageCode ? Lang.en : Lang.ru;
    }
    return Lang.en;
  }

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _stateHolder.setLocale(
      locale: _locale,
    );
  }

  void updateSetting() {
    final locale = _locale == Lang.ru ? Lang.en : Lang.ru;

    _sharedPreferences.setString(_localeKey, _locale.languageCode);
    _stateHolder.setLocale(locale: locale);
  }
}
