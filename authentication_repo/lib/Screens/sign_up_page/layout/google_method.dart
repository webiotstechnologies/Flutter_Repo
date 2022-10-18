import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication googleAuth =
  await googleUser!.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  /*userEmail = googleUser.email;
  userName = googleUser.displayName;
  userPhoto = googleUser.photoUrl;*/

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

/*
String? userEmail = "";
String? userName = "";
String? userPhoto = "";*/