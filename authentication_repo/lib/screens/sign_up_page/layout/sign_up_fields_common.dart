import 'package:authentication_repo/validation_form/text_field_validation_common.dart';

import '../../../config.dart';

class SignUpFieldsCommon extends StatelessWidget {
  const SignUpFieldsCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpCtrl) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Username Text
        Text(appFonts.userName,
            style: AppCss.montserratSemiBold16
                .textColor(appCtrl.appTheme.blackColor)),
        // Username Field
        TextFieldCommon(
            hintText: appFonts.enterUserName,
            controller: signUpCtrl.usernameController,
            validator: (username)=> Validation().usernameValidation(username)),
        const VSpace(Sizes.s40),
        // Email Field
        EmailCommon(emailController: signUpCtrl.emailController),
        const VSpace(Sizes.s40),
        // Password Text
        PasswordCommon(passController: signUpCtrl.passwordController),

      ]);
    });
  }
}
