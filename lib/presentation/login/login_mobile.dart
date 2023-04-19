import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/di.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateLoginSignUp = ref.watch(loginSignUpProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/desert.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                width: 400,
                height: 500,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: FirebaseUIActions(
                        actions: [
                          AuthStateChangeAction<SignedIn>((context, state) {
                            if (!state.user!.emailVerified) {
                              ref
                                  .read(navigationProvider)
                                  .pushHome(); // TODO: make verify-email page
                            } else {
                              ref.read(navigationProvider).pushHome();
                              // TODO: make profile page
                            }
                          }),
                        ],
                        child: LoginView(
                          action: AuthAction.signIn,
                          providers: FirebaseUIAuth.providersFor(
                            FirebaseAuth.instance.app,
                          ),
                        ),
                      ),
                    ),
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
