import 'package:authentication_repo/config.dart';

class OtpController extends GetxController {
  final GlobalKey<FormState> otpGlobalKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  RegExp regex = RegExp("^([0-9]{4}|[0-9]{6})");
  final data = Get.arguments;
  FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false;

  onLoadingFalse() {
    isLoading = false;
    update();
  }

  onLoadingTrue() {
    isLoading = true;
    update();
  }

  // Validate Otp Method
  onOtpMethod() async {
    if (otpGlobalKey.currentState!.validate()) {
      onLoadingTrue();
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: data[1], smsCode: otpController.text.toString());
        await auth.signInWithCredential(credential);
        onLoadingFalse();
        Get.toNamed(routeName.homeScreen);
      } catch (e) {
        onLoadingFalse();
        snackBarMessengers(message: appFonts.invalidCode);
      }
    }
  }
}
