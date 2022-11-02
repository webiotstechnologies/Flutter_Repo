import '../../config.dart';

class ResetPasswordScreen extends StatelessWidget {
  final restPassCtrl = Get.put(RestPasswordController());
    ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestPasswordController>(
      builder: (_) {
        return Scaffold(
          body: Form(
              key: restPassCtrl.resetPasswordGlobalKey,
              child: restPassCtrl.isLoading
                  ? const AlertDialogBox()
                  : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                // Enter Email Text
                Text(appFonts.email,
                    style: AppCss.montserratSemiBold16
                        .textColor(appCtrl.appTheme.blackColor)),
                // Enter Email Field
                TextFieldCommon(
                    hintText: appFonts.enterEmail,
                    controller: restPassCtrl.emailController,
                    validator: (email) =>
                        Validation().emailValidation(email)),
                // Reset Password Button
                ButtonCommon(
                    title: appFonts.resetPassword,
                    onTap: ()=> restPassCtrl.onResetPassword())
                    .paddingOnly(left: Insets.i14)
              ]).paddingOnly(
                  top: Insets.i80, left: Insets.i20, right: Insets.i20)),
        );
      }
    );
  }
}
