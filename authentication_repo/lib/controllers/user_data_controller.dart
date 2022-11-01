import 'package:authentication_repo/config.dart';

class UserDataController extends GetxController {
  bool isLoggedIn = false;
  dynamic userdata;
  String type = "",
      email = '',
      picture = '',
      name = '';

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
    var data = Get.arguments;
    if (data == null) {
      name = appCtrl.storage.read("name");
      email = appCtrl.storage.read("email") ?? "";
      picture = appCtrl.storage.read("photo") ?? "";
      type = appCtrl.storage.read("type") ?? "";
    } else {
      type = data["type"];
      if (type == "google") {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        email = googleUser!.email;
        name = googleUser.displayName!;
        picture = googleUser.photoUrl!;
      } else if (type == "facebook") {
        userdata = data["userData"];
        email = userdata["email"];
        picture = userdata["picture"]["data"]["url"];
        name = userdata["name"];
      } else if (type == "anonymously") {
        var user = FirebaseAuth.instance.currentUser;
        name = user!.uid;
      } else if (type == "firebaseAuth") {
        var user = FirebaseAuth.instance.currentUser;
        name = user!.email!;
        update();
      } else if (type == "phoneNumbers") {
        var phoneUser = FirebaseAuth.instance.currentUser;
        name = phoneUser!.phoneNumber!;
      } else if (type == "signInFirebase") {
        var signIn = FirebaseAuth.instance.currentUser;
        name = signIn!.email!;
      }
    }
    update();
    // TODO: implement onReady
    super.onReady();
  }

  // Logout Button
  onLogout () async{
    onLoadingTrue();
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    FacebookAuth.instance.logOut().then((value) {
      isLoggedIn = false;
      userdata = {};
      update();
      onLoadingFalse();
      Get.toNamed(routeName.signInScreen);
    });
    appCtrl.storage.erase();
  }
}
