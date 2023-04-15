import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/data/theme/theme_extension.dart';
import 'package:poem_app/domain/theme/theme_manager.dart';
import 'package:poem_app/domain/theme/theme_state_holder.dart';

class ThemeWidget extends ConsumerWidget {
  final Widget child;

  const ThemeWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeManagerProvider);

    final state = ref.watch(themeStateHolderProvider);

    return Theme(
      data: state == ThemeEnum.dark
          ? ThemeData.dark().copyWith(extensions: [MyThemeExtension.dark()])
          : ThemeData.light().copyWith(extensions: [MyThemeExtension.light()]),
      child: child,
    );
  }
}