import '../../config.dart';

class FbLogInLayout extends StatelessWidget {
  final userDataCtrl = Get.put(UserDataController());

  FbLogInLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDataController>(builder: (_) {
      return WillPopScope(
        onWillPop: () async{
          showDialog(
              context: context,
              builder: (BuildContext context) => const AlertDialogBack());
          return false;
        },
        child: Scaffold(
            body: Center(
                child: Column(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            // User Image
            if (userDataCtrl.picture != "")
              CircleAvatar(
                  radius: Sizes.s50,
                  backgroundImage: NetworkImage(userDataCtrl.picture)),
            // User Name
            Text(userDataCtrl.type == "anonymously" ? appFonts.loginAno : userDataCtrl.name, style: AppCss.montserratSemiBold16)
                .paddingSymmetric(vertical: Insets.i10),
            // User Email
            Text(userDataCtrl.email, style: AppCss.montserratMedium16)
          ]),
          // Logout Button
          ButtonCommon(
              title: appFonts.logout,
              onTap: ()=> userDataCtrl.onLogout())
        ]).paddingOnly(top: Insets.i80))),
      );
    });
  }
}
