import '../../config.dart';
import 'layout/fb_login_layout.dart';

class FbLoginScreen extends StatelessWidget {
  final fbLoginCtrl = Get.put(FacebookController());

  FbLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FacebookController>(builder: (_) {
      return Scaffold(
          body: Center(
              child: fbLoginCtrl.isLoggedIn
                  ? const FbLogOutLayout()
                  : const FbLoginLayout()));
    });
  }
}
