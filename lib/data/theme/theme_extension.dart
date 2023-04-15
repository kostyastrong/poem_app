import 'package:flutter/material.dart';
import 'package:poem_app/data/theme/theme_data.dart';

class MyThemeExtension extends ThemeExtension<MyThemeExtension> {
  final MyThemeData themeData;

  const MyThemeExtension._(this.themeData);

  factory MyThemeExtension.light() => const MyThemeExtension._(
    MyThemeData(
      buttonTextColor: Color.fromARGB(255, 3, 40, 29),
    ),
  );

  factory MyThemeExtension.dark() => const MyThemeExtension._(
    MyThemeData(
      buttonTextColor: Colors.purple,
    ),
  );

  @override
  ThemeExtension<MyThemeExtension> copyWith() => this;

  @override
  ThemeExtension<MyThemeExtension> lerp(
      ThemeExtension<MyThemeExtension>? other, double t) =>
      this;
}
