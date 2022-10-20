import '../../../config.dart';

class FbLogOutLayout extends StatelessWidget {
  const FbLogOutLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FacebookController>(builder: (fbLoginCtrl) {
      return Column(children: [
        // User Image
        CircleAvatar(
            radius: Sizes.s50,
            backgroundImage:
                NetworkImage(fbLoginCtrl.userdata["picture"]["data"]["url"])),
        // User Name
        Text(fbLoginCtrl.userdata["name"], style: AppCss.montserratSemiBold20).paddingSymmetric(vertical: Insets.i10),
        // User Email
        Text(
          fbLoginCtrl.userdata["email"],
          style: AppCss.montserratMedium16,
        ),
        // Logout Button
        ButtonCommon(
            title: appFonts.logout,
            onTap: () {
              fbLoginCtrl.onLoadingTrue();
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
