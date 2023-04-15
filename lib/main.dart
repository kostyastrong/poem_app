import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/presentation/settings_screen/settings_screen.dart';
import 'package:poem_app/presentation/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        home: ThemeWidget(
          child: SettingsScreen(),
        ),
      ),
    );
  }
}