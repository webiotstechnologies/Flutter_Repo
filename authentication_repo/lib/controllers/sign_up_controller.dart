import 'package:authentication_repo/config.dart';

class SignUpController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RegExp digitRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  GlobalKey<FormState> signUpGlobalKey = GlobalKey<FormState>();

  String? firebaseUser = '';
  bool isLoading = false;

  onLoadingFalse() {
    isLoading = false;
    update();
  }

  onLoadingTrue() {
    isLoading = true;
    update();
  }

  // Firebase Register With Email & Password
  signUpMethod() async {
    if (signUpGlobalKey.currentState!.validate()) {
      onLoadingTrue();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString());
        var user = FirebaseAuth.instance.currentUser;
        firebaseUser = user?.email;
        update();
        var data = {"userData": user, "type": "firebaseAuth"};
        onLoadingFalse();
        appCtrl.storage.write("name", firebaseUser);
        Get.offAllNamed(routeName.facebookScreen, arguments: data);
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          onLoadingFalse();
          snackBarMessengers(message: appFonts.emailAlreadyUse);
        }
      } catch (e) {
        onLoadingFalse();
        snackBarMessengers(message: appFonts.unknownError);
      }
    }
  }
}
