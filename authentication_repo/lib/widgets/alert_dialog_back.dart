import 'package:flutter/services.dart';
import '../config.dart';

class AlertDialogBack extends StatelessWidget {
  const AlertDialogBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        titleTextStyle:
            AppCss.montserratMedium16.textColor(appCtrl.appTheme.blackColor),
        title: Text(appFonts.areYouExit),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(appFonts.no,
                  style: AppCss.montserratSemiBold14
                      .textColor(appCtrl.appTheme.blackColor))),
          TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text(appFonts.yes,
                  style: AppCss.montserratSemiBold14
                      .textColor(appCtrl.appTheme.error)))
        ]);
  }
}
