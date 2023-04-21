import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'auth_notifier.dart';

class AuthManager {
  final AuthNotifier authNotifier;
  StreamSubscription<User?>? subscription;

  AuthManager(this.authNotifier);
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    authNotifier.setSignOut();
  }

  void signIn(User user) {
    authNotifier.setUser(user);
  }

  void init() {
    subscription ??=
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        signOut();
      } else {
        signIn(user);
      }
    });
  }

  void dispose() {
    subscription?.cancel();
    subscription = null;
  }
}
