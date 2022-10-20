import 'package:authentication_repo/config.dart';

class FacebookController extends GetxController {
  bool isLoggedIn = false;
  Map userdata = {};

  bool isLoading = false;

  onLoadingFalse() {
    isLoading = false;
    update();
  }

  onLoadingTrue() {
    isLoading = true;
    update();
  }

  // Facebook Authentication Method
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    onLoadingTrue();
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ["public_profile", "email"]);
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
