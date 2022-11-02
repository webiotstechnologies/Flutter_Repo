import 'package:authentication_repo/config.dart';

class RestPasswordController extends GetxController {
  GlobalKey<FormState> resetPasswordGlobalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  final RegExp digitRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isLoading = false;

  onLoadingFalse() {
    isLoading = false;
    update();
  }

  onLoadingTrue() {
    isLoading = true;
    update();
  }

  // Reset Password Method
  onResetPassword() {
    if (resetPasswordGlobalKey.currentState!.validate()) {
      onLoadingTrue();
      try{
        FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text.toString());
        onLoadingFalse();
        snackBarMessengers(message: appFonts.emailSend);
        Get.offAllNamed(routeName.signInScreen);
      } catch (e) {
        onLoadingFalse();
        snackBarMessengers(message: appFonts.unknownError);
      }

    }
  }
}
