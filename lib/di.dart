import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/edit/poem_edit/poem_edit_manager.dart';
import 'package:poem_app/domain/login/login_manager.dart';
import 'package:poem_app/domain/navigation/navigation.dart';

import 'domain/db/db_manager.dart';
import 'domain/edit/changing_poem/poems_notifier.dart';
import 'domain/edit/poem_edit/poem_edit_notifier.dart';
import 'domain/edit/poem_edit/poem_edit_state.dart';
import 'domain/login/login_sign_up_notifier.dart';
import 'domain/login/login_sign_up_state.dart';
import 'domain/models/poem_model.dart';

final navigationProvider = Provider((ref) => Navigation());
final loginSignUpProvider =
    StateNotifierProvider<LoginSignUpNotifier, LoginSignUpState>(
  (ref) => LoginSignUpNotifier(),
);
final loginManagerProvider =
    Provider((ref) => LoginManager(ref.watch(loginSignUpProvider.notifier)));

final poemEditNotifier = StateNotifierProvider<PoemEditNotifier, PoemEditState>(
  (ref) => PoemEditNotifier(),
); // state of settings of editing poem
final poemEditManager =
    Provider((ref) => PoemEditManager(ref.watch(poemEditNotifier.notifier)));

final authFirebaseProvider = Provider((ref) => FirebaseAuth.instance);
final dbFirebaseProvider = Provider((ref) => FirebaseFirestore.instance);

final poemsNotifierProvider =
    StateNotifierProvider<PoemsNotifier, List<PoemModel>>(
  (ref) => PoemsNotifier(),
);

final dbPoemsManagerProvider = Provider(
  (ref) => DbPoemManager(ref.watch(poemsNotifierProvider.notifier))..init(),
);
