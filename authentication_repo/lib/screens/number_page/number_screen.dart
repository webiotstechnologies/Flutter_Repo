import '../../config.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<SignInController>(
      builder: (signInCtrl) {
        return Scaffold(
          // Number Field Layout
            body: Form(
                key: signInCtrl.numberGlobalKey,
                child: signInCtrl.isLoading
                    ? const AlertDialogBox()
                    : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  // Enter Number Text
                  Text(appFonts.number,
                      style: AppCss.montserratSemiBold16
                          .textColor(appCtrl.appTheme.blackColor)),
                  // Enter Number Field
                  TextFieldCommon(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      hintText: appFonts.enterNumber,
                      controller: signInCtrl.numberController,
                      validator: (number) =>
                          Validation().numberValidation(number)),
                  // Send Otp Button
                  ButtonCommon(
                      title: appFonts.sendOtp,
                      onTap: () => signInCtrl.numberMethod())
                      .paddingOnly(left: Insets.i34)
                ]).paddingOnly(
                    top: Insets.i80, left: Insets.i20, right: Insets.i20)),
        );
      }
    );
  }
}
