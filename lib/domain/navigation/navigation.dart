import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routes.dart';

class Navigation {
  static final navigationKey = GlobalKey<NavigatorState>();

  void pushLogin() {
    navigationKey.currentState!.pushNamed(Routes.login);
  }

  void pushEdit() {
    navigationKey.currentState!.pushNamed(Routes.edit);
  }

  BuildContext getContext() {
    return navigationKey.currentContext!;
  }

  void pushSettings() {
    navigationKey.currentState!.pushNamed(Routes.settings);
  }

  void pushHome() {
    final container = ProviderContainer();
    navigationKey.currentState!.pushNamed(Routes.home);
  }
}
