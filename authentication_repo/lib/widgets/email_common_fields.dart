import 'package:authentication_repo/validation_form/text_field_validation_common.dart';
import '../config.dart';

class EmailCommon extends StatelessWidget {
  final TextEditingController? emailController;

  const EmailCommon({Key? key,this.emailController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email Text
        Text(appFonts.email,
            style: AppCss.montserratSemiBold16
                .textColor(appCtrl.appTheme.blackColor)),
        // Email Field
        TextFieldCommon(
            hintText: appFonts.enterEmail,
            controller: emailController,
            validator: (email)=> Validation().emailValidation(email)),


      ]
    );
  }
}
