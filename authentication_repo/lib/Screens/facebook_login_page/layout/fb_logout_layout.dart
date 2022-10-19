import '../../../config.dart';

class FbLogOutLayout extends StatelessWidget {
  const FbLogOutLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FacebookController>(builder: (fbLoginCtrl) {
      return Column(children: [
        CircleAvatar(
            radius: Sizes.s50,
            backgroundImage:
                NetworkImage(fbLoginCtrl.userdata["picture"]["data"]["url"])),
        Text(fbLoginCtrl.userdata["name"], style: AppCss.montserratSemiBold20).paddingSymmetric(vertical: Insets.i10),
        Text(
          fbLoginCtrl.userdata["email"],
          style: AppCss.montserratMedium16,
        ),
        ButtonCommon(
            title: appFonts.logout,
            onTap: () {
              FacebookAuth.instance.logOut().then((value) {
                fbLoginCtrl.isLoggedIn = false;
                fbLoginCtrl.userdata = {};
                fbLoginCtrl.update();
              });
            })
      ]).paddingOnly(top: Insets.i80);
    });
  }
}
