import '../config.dart';

// Scaffold Messenger Common
 snackBarMessengers ({message}) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
         duration: const Duration(seconds: 3),
         content: Text(message,
             style: AppCss.montserratMedium16
                 .textColor(appCtrl.appTheme.whiteColor)),
         backgroundColor: appCtrl.appTheme.error));
   }

