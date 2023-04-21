import 'package:flutter/material.dart';

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
    navigationKey.currentState!.pushNamed(Routes.home);
  }
}
