import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/theme/theme_manager.dart';
import 'package:poem_app/domain/theme/theme_state_holder.dart';
import 'package:poem_app/presentation/lang.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(
      themeStateHolderProvider.select(
        (state) => state.toBool(),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Lang.of(context).darkTheme,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Switch(
          value: isDark,
          onChanged: (_) => ref.watch(themeManagerProvider).updateSetting(),
        ),
      ],
    );
  }
}
