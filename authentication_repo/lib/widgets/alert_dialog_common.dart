import '../config.dart';

class AlertDialogBox extends StatelessWidget {
  const AlertDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Alert DialogBox & CircularProgressIndicator
      child: AlertDialog(
          titleTextStyle: AppCss.montserratSemiBold16.textColor(appCtrl.appTheme.blackColor),
          title: Center(
              child: Column(children: [
                CircularProgressIndicator(color: appCtrl.appTheme.indigo),
                const VSpace(Sizes.s5),
                 Text(appFonts.loading)
              ]))),
    );
  }
}
