import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/navigation/named_routes.dart';
import 'package:poem_app/presentation/settings_screen/settings_screen.dart';
import 'package:poem_app/presentation/theme/theme.dart';

import 'domain/firebase_options.dart';

Future<void> main() async {
  // Slow down time to see lerping.
  timeDilation = 0.5;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const NamedRoutesWithParams());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        home: ThemeWidget(child: SettingsScreen()),
      ),
    );
  }
}
