import 'package:authentication_repo/config.dart';

class HomeController extends GetxController {

  // Firebase SignOut
    firebaseSignOut () async{
      try {
        await FirebaseAuth.instance.signOut();
        snackBarMessengers(message: appFonts.signOutSuccess);
        Get.toNamed(routeName.signUpScreen);
      } on FirebaseAuthException catch (e) {
        snackBarMessengers(message: appFonts.somethingWentWrong);
      } catch (e) {
        snackBarMessengers(message: appFonts.unknownError);
      }
    }

    // Google Sign Out
    googleSignOut () async{
      try {
        await GoogleSignIn().signOut();
        snackBarMessengers(message: appFonts.signOutSuccess);
        Get.toNamed(routeName.signUpScreen);
      } on FirebaseAuthException catch (e) {
        snackBarMessengers(message: appFonts.somethingWentWrong);
      } catch (e) {
        snackBarMessengers(message: appFonts.unknownError);
      }
    }
}