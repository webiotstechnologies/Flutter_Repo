import '../../config.dart';

class HomeScreen extends StatelessWidget {
  final homeCtrl = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            // Authentication Successfully Text
            child: Text(appFonts.authentication,
                style: AppCss.montserratRegular18
                    .textColor(appCtrl.appTheme.indigo))),
        // Firebase SignOut Button
        ButtonCommon(
            title: appFonts.firebaseSignOut,
            onTap: () => homeCtrl.firebaseSignOut()),
        // Google SignOut Button
        ButtonCommon(
            title: appFonts.signOut, onTap: () => homeCtrl.googleSignOut())
      ]));
    });
  }
}
