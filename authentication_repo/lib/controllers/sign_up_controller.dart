import 'package:authentication_repo/config.dart';

class SignUpController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final RegExp digitRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  GlobalKey<FormState> signUpGlobalKey = GlobalKey<FormState>();
  GlobalKey<FormState> numberGlobalKey = GlobalKey<FormState>();

  bool isLoading = false;

  onLoadingFalse() {
    isLoading = false;
    update();
  }

  onLoadingTrue() {
    isLoading = true;
    update();
  }

  // Firebase Authentication
  signUpMethod() async {
    if (signUpGlobalKey.currentState!.validate()) {
      onLoadingTrue();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString());
        onLoadingFalse();
        Get.back();
      } on FirebaseAuthException catch (e) {
        if(e.code == "email-already-in-use") {
          onLoadingFalse();
          snackBarMessengers(message: appFonts.emailAlreadyUse);
        }
        onLoadingFalse();
        snackBarMessengers(message: appFonts.somethingWentWrong);
      } catch (e) {
        onLoadingFalse();
        snackBarMessengers(message: appFonts.unknownError);
      }
    }
  }

  // SignIn With Google Method
  Future<UserCredential> signInWithGoogle() async {
    onLoadingTrue();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,

    );
    onLoadingFalse();
    Get.toNamed(routeName.homeScreen);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Anonymous Login Method
  Future signInAnonymous() async {
    try {
      onLoadingTrue();
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      onLoadingFalse();
      Get.toNamed(routeName.homeScreen);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          onLoadingFalse();
          snackBarMessengers(message: appFonts.anonymousNotEnabled);
          break;
        default:
          onLoadingFalse();
          snackBarMessengers(message: appFonts.unknownError);
      }
    }
  }

  numberMethod() async {
    if (numberGlobalKey.currentState!.validate()) {
      // Otp Method
      onLoadingTrue();
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 ${numberController.text.toString()}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) async {
          verificationId = verificationId;
          onLoadingFalse();
          Get.toNamed(routeName.otpScreen,
              arguments: [numberController.text, verificationId]);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }
}
