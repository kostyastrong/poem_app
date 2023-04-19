import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/authorization/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());
}
