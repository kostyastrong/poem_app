import 'package:flutter/material.dart';
import 'package:poem_app/presentation/edit/edit.dart';
import 'package:poem_app/presentation/home_page.dart';
import 'package:poem_app/presentation/login/login_mobile.dart';
import 'package:poem_app/presentation/settings_screen/settings_screen.dart';

class Routes {
  static const home = '/';
  static const settings = '/settings';
  static const login = '/login';
  static const edit = '/edit';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final Widget widget;
    switch (routeSettings.name) {
      case edit:
        widget = const EditPage();
        break;
      case settings:
        widget = const SettingsScreen();
        break;
      case login:
        widget = const LoginPage();
        break;
      default:
        widget = const HomePage();
        break;
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
