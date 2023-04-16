import 'package:flutter/material.dart';

class AlignButton extends StatelessWidget {
  const AlignButton({Key? key, required this.alignFunc, required this.icon})
      : super(key: key);
  final alignFunc;
  final icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red[50],
          shape: CircleBorder(),
          side: BorderSide(color: Colors.red, width: 2),
        ),
        onPressed: () {
          alignFunc();
        },
        child: Center(child: icon));
  }
}
