import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_sign_up_state.freezed.dart';

@freezed
class LoginSignUpState with _$LoginSignUpState {
  const factory LoginSignUpState.login() = Login;

  const factory LoginSignUpState.signup() = SignUp;

  const factory LoginSignUpState.forgotPass() = ForgotPass;
}
