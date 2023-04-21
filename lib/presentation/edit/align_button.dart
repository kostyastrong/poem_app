import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AlignButton extends StatelessWidget {
  const AlignButton({
    Key? key,
    required this.align,
    required this.alignFunc,
    required this.icon,
  }) : super(key: key);
  final Function alignFunc;
  final TextAlign align;
  final SvgPicture icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red[50],
        shape: const CircleBorder(),
        side: const BorderSide(color: Colors.red, width: 2),
      ),
      onPressed: () {
        alignFunc(align);
      },
      child: Center(child: icon),
    );
  }
}
