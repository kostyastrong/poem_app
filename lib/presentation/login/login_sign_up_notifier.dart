import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/presentation/login/login_sign_up_state.dart';

class LoginSignUpNotifier extends StateNotifier<LoginSignUpState> {
  LoginSignUpNotifier(): super(LoginSignUpState.login());

  void changeToSignUp() {
    state = const LoginSignUpState.signup();
  }

  void changeToForgotPass() {
    state = const LoginSignUpState.forgotPass();
  }
}