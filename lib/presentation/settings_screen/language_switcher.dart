import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/l10n/localization_state_holder.dart';
import 'package:poem_app/presentation/lang.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEn = false;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Lang.of(context).language,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Switch(
          value: isEn,
          onChanged: (_) => ref.watch(l10nStateHolderProvider),
        ),
      ],
    );
  }
}
