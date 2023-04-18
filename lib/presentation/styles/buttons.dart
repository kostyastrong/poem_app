import 'package:flutter/material.dart';

abstract class ThemeButton {
  static const ButtonStyle redButton =
      ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red));

  static const ButtonStyle blackButton =
      ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black));

  static ElevatedButton circleTapButton(
    func,
    Widget? icon, {
    Color backgroundColor = const Color.fromRGBO(
      237,
      190,
      190,
      1.0,
    ),
  }) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, shape: const CircleBorder()),
      child: icon,
    );
  }
}
