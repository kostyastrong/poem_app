import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/di.dart';
import 'package:poem_app/presentation/lang.dart';
import 'package:poem_app/presentation/settings_screen/language_switcher.dart';
import 'package:poem_app/presentation/settings_screen/theme_switch_row.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Lang.of(context).settings),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const ThemeSwitcher(),
            const LanguageSwitcher(),
            const Spacer(),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  ref.watch(navigationProvider).pushLogin();
                },
                child: Text(
                  Lang.of(context).logout,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
