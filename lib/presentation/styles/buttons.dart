import 'package:flutter/material.dart';

abstract class ThemeButton {
  static const ButtonStyle redButton =
      ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red));

  static const ButtonStyle blackButton =
      ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black));
}

class CircleTapButton extends StatelessWidget {
  CircleTapButton({
    Key? key,
    this.func,
    Widget? icon,
    Color backgroundColor = const Color.fromRGBO(237, 190, 190, 1.0),
  }) : super(key: key) {
    this.backgroundColor = backgroundColor;
    this.icon = icon;
  }

  final func;
  late final Color backgroundColor;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const CircleBorder(),
      ),
      child: icon,
    );
  }
}
