import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    User? currentFirebaseUser;
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    try {
      UserCredential credentials =
          await FirebaseAuth.instance.signInWithCredential(credential);
      currentFirebaseUser = credentials.user;
    } catch (e) {
      print(e);
    }
    return currentFirebaseUser;
  }

  signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      await googleSignIn.signOut();

      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('error al cerrar sesion : ');
      print(e);
    }
  }

  verifyAuth() {
    final FirebaseAuth auth = FirebaseAuth.instance;

    User? user = auth.currentUser;
    return user;
  }
}
