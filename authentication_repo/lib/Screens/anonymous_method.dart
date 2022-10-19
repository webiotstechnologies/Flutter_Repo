import 'package:authentication_repo/config.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //
  Future signInAnonymous () async{
    try {
      final userCredential =
      await FirebaseAuth.instance.signInAnonymously();
      Get.toNamed(routeName.homeScreen);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
}