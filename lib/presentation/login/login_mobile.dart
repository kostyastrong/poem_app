import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poem_app/di.dart';
import 'package:poem_app/presentation/lang.dart';
import 'package:poem_app/presentation/login/forgotPassInner.dart';
import 'package:poem_app/presentation/login/login_inner.dart';
import 'singup_inner.dart';
import '/presentation/styles/texts.dart';

import 'package:poem_app/presentation/styles/buttons.dart';

class LoginMobile extends ConsumerWidget {
  const LoginMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateLoginSignUp = ref.watch(loginSignUpProvider);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/backgrounds/desert.jpg'),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: SizedBox(
              width: 400,
              height: 500,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: stateLoginSignUp.when(
                        login: () => LoginInner(), signup: () => SignUpInner(),
                    forgotPass: () => ForgotPassInner(),),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
