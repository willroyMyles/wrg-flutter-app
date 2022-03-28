import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

mixin ApiAuth {
  FirebaseAuth auth;

  login() {}

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Obtain the auth details from the request

      // Create a new credential

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await auth.signInWithCredential(credential);
    } catch (error) {
      print(error);
      return Future.error("did not sign in");
    }
    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  logout() {
    GoogleSignIn().signOut();
    auth.signOut();
  }
}
