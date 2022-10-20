import '../../config.dart';


class FbLoginScreen extends StatelessWidget {
  final fbLoginCtrl = Get.put(FacebookController());

  FbLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FacebookController>(builder: (_) {
      return Scaffold(
          body: Center(
              child: fbLoginCtrl.isLoggedIn
              // LogIn Button & User Data
                  ? const FbLogOutLayout()
              // LogIn Button Layout
                  : fbLoginCtrl.isLoading ? const AlertDialogBox() : const FbLoginLayout()));
    });
  }
}
