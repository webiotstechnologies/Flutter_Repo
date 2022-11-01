import '../config.dart';

class PasswordCommon extends StatelessWidget {
  final TextEditingController? passController;

  const PasswordCommon({Key? key, this.passController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Password Text
      Text(appFonts.password,
          style: AppCss.montserratSemiBold16
              .textColor(appCtrl.appTheme.blackColor)),
       // Password Field
      TextFieldCommon(
          hintText: appFonts.enterPassword,
          controller: passController,
          validator: (password) => Validation().passValidation(password))
    ]);
  }
}
