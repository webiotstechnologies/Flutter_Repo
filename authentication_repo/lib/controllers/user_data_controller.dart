import 'package:authentication_repo/config.dart';

class UserDataController extends GetxController {
  bool isLoggedIn = false;
  dynamic userdata;
  String type = "",
      email = '',
      picture = '',
      name = '',
      anonymousData = '',
      firebaseUser = "",
      phoneNumber = '',
      signInData = "";

  bool isLoading = false;

  onLoadingFalse() {
    isLoading = false;
    update();
  }

  onLoadingTrue() {
    isLoading = true;
    update();
  }

  @override
  void onReady() async {
    var data = Get.arguments ?? "";
    type = data["type"];
    if (type == "google") {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      email = googleUser.email;
      name = googleUser.displayName!;
      picture = googleUser.photoUrl!;

    } else if (type == "facebook") {
      userdata = data["userData"];
      email = userdata["email"];
      picture = userdata["picture"]["data"]["url"];
      name = userdata["name"];

    } else if (type == "anonymously") {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      var user = FirebaseAuth.instance.currentUser;
      anonymousData = user!.uid;

    } else if (type == "firebaseAuth") {
      var user = FirebaseAuth.instance.currentUser;
      firebaseUser = user!.email!;
      update();

    } else if (type == "phoneNumber") {
      var phoneUser = FirebaseAuth.instance.currentUser;
      phoneNumber = phoneUser!.phoneNumber!;

    } else if (type == "signInFirebase") {
      var signIn = FirebaseAuth.instance.currentUser;
      signInData = signIn!.email!;
    }
    update();
    // TODO: implement onReady
    super.onReady();
  }
}
