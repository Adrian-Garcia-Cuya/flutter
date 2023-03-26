import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nav/Service/auth_service.dart';

import 'home.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final navigator = Navigator.of(context);
            User? user = await AuthService().signInWithGoogle();
            if (user == null) {
              print('user is null');
            } else {
              navigator.pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Home(
                    title: 'Lugares',
                  ),
                ),
              );
            }
          },
          child: const Text('Login with google'),
        ),
      ),
    );
  }
}
