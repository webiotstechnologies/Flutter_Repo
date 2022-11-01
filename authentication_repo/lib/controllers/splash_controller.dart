import 'dart:async';
import 'package:authentication_repo/config.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Timer(const Duration(seconds: 2), () {
      var userName = appCtrl.storage.read("name");
      var userEmail = appCtrl.storage.read("email");
      var userPhoto = appCtrl.storage.read("photo");

      if (userEmail != null || userName != null || userPhoto != null) {
        Get.offAllNamed(routeName.facebookScreen);
      } else {
        Get.offAllNamed(routeName.signInScreen);
      }
      update();
    });
    // TODO: implement onReady
    super.onReady();
  }
}
