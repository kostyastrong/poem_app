import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultLoginPage extends StatelessWidget {
  const DefaultLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreen(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (!state.user!.emailVerified) {
              Navigator.pushNamed(context, '/verify-email');
            } else {
              Navigator.pushReplacementNamed(context, '/profile');
            }
          }),
        ],
      ),
    );
  }
}
