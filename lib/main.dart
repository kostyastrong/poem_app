import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/navigation/named_routes.dart';

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
