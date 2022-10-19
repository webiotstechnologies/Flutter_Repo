import '../../../config.dart';

class FbLoginLayout extends StatelessWidget {
  const FbLoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FacebookController>(builder: (fbLoginCtrl) {
      return Column(children: [
        Image.asset(eImageAssets.facebook, scale: 8),
        ButtonCommon(
            title: appFonts.loginWithFb,
            onTap: () async {
              signInWithFacebook().then((value) {
                FacebookAuth.instance.getUserData().then((userData) {
                  fbLoginCtrl.isLoggedIn = true;
                  fbLoginCtrl.userdata = userData;
                  fbLoginCtrl.update();
                });
              });
            })
      ]).paddingOnly(top: Insets.i80);
    });
  }
}
