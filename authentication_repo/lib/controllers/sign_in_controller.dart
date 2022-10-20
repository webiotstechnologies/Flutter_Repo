import '../config.dart';

class SignInController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RegExp digitRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
   GlobalKey<FormState> signInGlobalKey = GlobalKey<FormState>();

  bool isLoading = false;

  onLoadingFalse () {
    isLoading = false;
    update();
  }

  onLoadingTrue () {
    isLoading = true;
    update();
  }

  // Sign In With Email & Password Method
   signInMethod() async{
     if (signInGlobalKey.currentState!.validate()) {
       onLoadingTrue();
       try {
         await FirebaseAuth.instance.signInWithEmailAndPassword(
             email: emailController.text.toString(),
             password: passwordController.text.toString());
         onLoadingFalse();
         Get.toNamed(routeName.homeScreen);
       } on FirebaseAuthException catch (e) {
         if (e.code == 'wrong-password') {
           onLoadingFalse();
           snackBarMessengers(message: appFonts.wrongPassword);
         } else if (e.code == 'user-not-found') {
           onLoadingFalse();
           snackBarMessengers(message: appFonts.userNotFound);
         }
       } catch (e) {
         onLoadingFalse();
         snackBarMessengers(message: appFonts.unknownError);
       }
     }
   }

}