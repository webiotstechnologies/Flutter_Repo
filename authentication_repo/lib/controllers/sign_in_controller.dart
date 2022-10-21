import '../config.dart';

class SignInController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RegExp digitRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
   GlobalKey<FormState> signInGlobalKey = GlobalKey<FormState>();
  GlobalKey<FormState> numberGlobalKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();

  String? userEmail = "";
  String? userName = "";
  String? userPhoto = "";
  String? anonymousData = '';
  String? phoneNumber = '';
  String? signInData = "";

  bool isLoading = false;

  bool isLoggedIn = false;
  Map userdata = {};

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

         var signIn =  FirebaseAuth.instance.currentUser;
         signInData = signIn!.email;
         update();
         var data = {
           "userData": signIn,
           "type":"signInFirebase"
         };
         onLoadingFalse();
         emailController.text = "";
         passwordController.text = "";
         Get.offAllNamed(routeName.facebookScreen,arguments: data);
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

  // SignIn With Google Method
  Future<UserCredential> signInWithGoogle() async {
    onLoadingTrue();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    userEmail = googleUser.email;
    userName = googleUser.displayName;
    userPhoto = googleUser.photoUrl;
    update();
    var data ={
      "userData": googleUser,
      "type":"google"
    };
    onLoadingFalse();
    appCtrl.storage.write("name", userName);
    appCtrl.storage.write("email", userEmail);
    appCtrl.storage.write("photo", userPhoto);
    Get.offAllNamed(routeName.facebookScreen,arguments: data);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Anonymous Login Method
  Future signInAnonymous() async {
    try {
      onLoadingTrue();
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      var user =  FirebaseAuth.instance.currentUser;
      anonymousData = user!.uid;
      update();
      var data ={
        "userData": user,
        "type":"anonymously"
      };

      onLoadingFalse();
      Get.offAllNamed(routeName.facebookScreen,arguments: data);
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

  // Facebook Authentication Method
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    onLoadingTrue();
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ["public_profile", "email"]);
    // Create a credential from the access token
    final AuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.token);
   await FacebookAuth.instance.getUserData().then((userData) {
      isLoggedIn = true;
      userdata = userData;
      update();
      var data ={
        "userData": userdata,
        "type":"facebook"
      };
      onLoadingFalse();
      Get.offAllNamed(routeName.facebookScreen,arguments: data);
    });

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
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
          var phoneUser =  FirebaseAuth.instance.currentUser;
          phoneNumber = phoneUser!.phoneNumber;
          update();
          var data ={
            "userData": phoneUser,
            "type":"phoneNumber"
          };
          onLoadingFalse();
          Get.toNamed(routeName.otpScreen,
              arguments: [numberController.text, verificationId,data]);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }
  @override
  void onReady() {
    userName = appCtrl.storage.read("name");
    userEmail = appCtrl.storage.read("email");
    userPhoto = appCtrl.storage.read("photo");

    if(userName != null && userName != null && userPhoto != null) {
         Get.offAllNamed(routeName.facebookScreen);
    } else {
      Get.offAllNamed(routeName.signInScreen);
    }

    update();
    // TODO: implement onReady
    super.onReady();
  }
}