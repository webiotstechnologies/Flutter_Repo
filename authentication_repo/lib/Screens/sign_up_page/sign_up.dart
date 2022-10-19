import '../../config.dart';
import 'layout/sign_up_layout.dart';

class SignUpScreen extends StatelessWidget {
  final signUpCtrl = Get.put(SignUpController());
   SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
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
                            Text(appFonts.signUp,style: AppCss.montserratMedium28.textColor(appCtrl.appTheme.whiteColor))
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
                          child: const SignUpLayout().paddingSymmetric(horizontal: Insets.i30).paddingOnly(top: Insets.i70)
                    ))
              ],
            ));
      }
    );
  }
}
