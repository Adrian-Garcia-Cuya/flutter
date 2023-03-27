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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: const Text(
              'INICIA SESION Y ENCUENTRA LOS MEJORES LUGARES',
              style: TextStyle(
                color: Color.fromARGB(255, 66, 66, 66),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          TextButton(
            onPressed: () async {
              final navigator = Navigator.of(context);
              User? user = await AuthService().signInWithGoogle();
              if (user != null) {
                navigator.pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(35, 8, 35, 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Image(
                    image: AssetImage('assets/google_icon.png'),
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: 20,
                        // color: kColorText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
