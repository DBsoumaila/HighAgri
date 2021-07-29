import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;

  Future<void> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Faible mot de passe');
      } else if (e.code == 'email-already-in-use') {
        print('Ce compte eexiste déjà avec cet Email');
      }
    }
  }

  Future<void> signUpEmailNameOnly(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Faible mot de passe');
      } else if (e.code == 'email-already-in-use') {
        print('Ce compte eexiste déjà avec cet Email');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isAuthentificated() async {
    bool alreadeSigedIn = false;
    _fireAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        alreadeSigedIn = false;
      } else {
        alreadeSigedIn = true;
      }
    });
    return alreadeSigedIn;
  }

  Future<void> verifyUserMail() async {
    User? user = _fireAuth.currentUser;

//si l' utilisateur existe et qu'il n'est pas encore authentifié, enusuite on ouvre

    if (!user!.emailVerified) {
      var actionCodeSettings = ActionCodeSettings(
          url: 'https://www.example.com/?email=${user.email}',
          dynamicLinkDomain: "example.page.link",
          androidPackageName: "com.example.ha2",
          androidInstallApp: true,
          androidMinimumVersion: "12",
          iOSBundleId: "com.example.ios",
          handleCodeInApp: true);

      await user.sendEmailVerification(actionCodeSettings);
    }
  }

  Future<void> deconnexion() async {
    await _fireAuth.signOut();
  }

  Future<void> suppUser() async {
    try {
      await _fireAuth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print('Veuillez vous connecter d abord');
      }
    }
  }

  Future<void> reAuthentificqtionAvantCetteAction(
      String emailEntre, String passwordEntre) async {
    // Prompt the user to enter their email and password

// Create a credential
    AuthCredential credential = EmailAuthProvider.credential(
        email: emailEntre, password: passwordEntre);

// Reauthenticate
    await _fireAuth.currentUser!.reauthenticateWithCredential(credential);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final AccessToken result =
        (await FacebookAuth.instance.login()) as AccessToken;

    // Create a credential from the access token
    final facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }
}
