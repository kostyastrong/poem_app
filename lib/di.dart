import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/authentication.dart';
import 'package:poem_app/domain/login/login_manager.dart';
import 'package:poem_app/domain/navigation/navigation.dart';

import 'domain/login/login_sign_up_notifier.dart';
import 'domain/login/login_sign_up_state.dart';

final navigation = Provider((ref) => Navigation());
final authenticationProvider = Provider((ref) => Authentication());
final loginSignUpProvider =
    StateNotifierProvider<LoginSignUpNotifier, LoginSignUpState>(
        (ref) => LoginSignUpNotifier());
final managerProvider =
    Provider((ref) => LoginManager(ref.watch(loginSignUpProvider.notifier)));

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authenticationProvider).authStateChange;
});
final fireBaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});
