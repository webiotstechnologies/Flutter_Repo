

import '../../config.dart';
import '../../controllers/sign_in_controller.dart';
import 'layout/login_layout.dart';

class SignInScreen extends StatelessWidget {
  final signInCtrl = Get.put(SignInController());
   SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: appCtrl.appTheme.indigo,
          body: Column(
            children: [
              Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    color: appCtrl.appTheme.indigo,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(appFonts.welcome,style: AppCss.montserratMedium16.textColor(appCtrl.appTheme.lightBg)).paddingSymmetric(vertical: Sizes.s5),
                        Text(appFonts.signIn,style: AppCss.montserratMedium28.textColor(appCtrl.appTheme.whiteColor))
                      ],
                    ).paddingSymmetric(horizontal: Insets.i30).paddingOnly(top: Insets.i90),
                  )),
              Expanded(
                  flex: 13,
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: appCtrl.appTheme.whiteColor,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(Sizes.s30),
                              topLeft: Radius.circular(Sizes.s30))),
                      child: const LoginLayout().paddingSymmetric(horizontal: Insets.i30).paddingOnly(top: Insets.i70)
                  ))
            ],
          )
        );
      }
    );
  }
}
