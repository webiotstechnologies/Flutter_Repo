import '../../../config.dart';

class FbLogInLayout extends StatelessWidget {
  final userDataCtrl = Get.put(UserDataController());

  FbLogInLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDataController>(builder: (_) {
      return Scaffold(
          body: Center(
              child: Column(children: [
        userDataCtrl.signInData.isEmpty
            ? userDataCtrl.phoneNumber.isEmpty
                ? userDataCtrl.anonymousData.isEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            // User Image
                            if (userDataCtrl.picture != "")
                              CircleAvatar(
                                  radius: Sizes.s50,
                                  backgroundImage: NetworkImage(
                                      userDataCtrl.picture)),
                            // User Name
                            Text(userDataCtrl.name,
                                    style: AppCss.montserratSemiBold20)
                                .paddingSymmetric(vertical: Insets.i10),
                            // User Email
                            Text(userDataCtrl.email,
                                style: AppCss.montserratMedium16)
                          ])
                    : Text("Anonymous Data: ${userDataCtrl.anonymousData}",
                        style: AppCss.montserratRegular14)
                : Text("Phone Number: ${userDataCtrl.phoneNumber}",
                    style: AppCss.montserratSemiBold16)
            : Text("Email: ${userDataCtrl.signInData}",
                style: AppCss.montserratSemiBold16),
        // Logout Button
        ButtonCommon(
            title: appFonts.logout,
            onTap: () async {
              userDataCtrl.onLoadingTrue();
              await GoogleSignIn().signOut();
              await FirebaseAuth.instance.signOut();
              FacebookAuth.instance.logOut().then((value) {
                userDataCtrl.isLoggedIn = false;
                userDataCtrl.userdata = {};
                userDataCtrl.update();
                print(userDataCtrl.picture);
                userDataCtrl.onLoadingFalse();
                Get.toNamed(routeName.signInScreen);
              });
            })
      ]).paddingOnly(top: Insets.i80)));
    });
  }
}
