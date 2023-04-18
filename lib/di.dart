import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/edit/appearance/appearance_manager.dart';
import 'package:poem_app/domain/edit/appearance/appearance_notifier.dart';
import 'package:poem_app/domain/edit/appearance/appearance_state.dart';
import 'package:poem_app/domain/login/login_manager.dart';
import 'package:poem_app/domain/navigation/navigation.dart';

import 'domain/db/db_manager.dart';
import 'domain/login/login_sign_up_notifier.dart';
import 'domain/login/login_sign_up_state.dart';

final navigation = Provider((ref) => Navigation());
final loginSignUpProvider =
    StateNotifierProvider<LoginSignUpNotifier, LoginSignUpState>(
  (ref) => LoginSignUpNotifier(),
);
final loginManagerProvider =
    Provider((ref) => LoginManager(ref.watch(loginSignUpProvider.notifier)));

final appearProvider = StateNotifierProvider<AppearNotifier, AppearState>(
  (ref) => AppearNotifier(),
);
final appearManagerProvider =
    Provider((ref) => AppearManager(ref.watch(appearProvider.notifier)));

final authFirebaseProvider = Provider((ref) => FirebaseAuth.instance);
final dbFirebaseProvider = Provider((ref) => FirebaseFirestore.instance);
final dbManagerProvider = Provider((ref) => DbPoemManager());
