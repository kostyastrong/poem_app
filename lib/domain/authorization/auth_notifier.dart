import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/authorization/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  void setSignOut() {
    state = state.copyWith(user: null);
  }

  void setUser(User user) {
    state = state.copyWith(user: user);
  }
}
