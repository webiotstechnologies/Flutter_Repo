import '../../../config.dart';

class NumberLayout extends StatelessWidget {
  const NumberLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (signUpCtrl) {
        return Form(
          key: signUpCtrl.numberGlobalKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appFonts.number,
                    style: AppCss.montserratSemiBold16
                        .textColor(appCtrl.appTheme.blackColor)),
                TextFieldCommon(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  hintText: appFonts.enterNumber,
                  controller: signUpCtrl.numberController,
                  validator: (number) {
                    if (number.isEmpty) {
                      return appFonts.pleaseEnterNumber;
                    }
                    if (number.length < 10) {
                      return appFonts.enterValidNumber;
                    }
                    return null;
                  },
                ),
                ButtonCommon(title: appFonts.fetchOtp).inkWell(
                    onTap: () async{
                      if (signUpCtrl.numberGlobalKey.currentState!.validate()) {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber:
                          '+91 ${signUpCtrl.numberController.text.toString()}',
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId,
                              int? resendToken) async {
                            verificationId = verificationId;
                            Get.toNamed(routeName.otpScreen,
                                arguments: [
                                  signUpCtrl.numberController.text,
                                  verificationId
                                ]);
                          },
                          codeAutoRetrievalTimeout:
                              (String verificationId) {},
                        );
                      }
                    }
                ).paddingOnly(left: Insets.i35)
              ]
          ).paddingOnly(top: Insets.i80,left: Insets.i20,right: Insets.i20),
        );
      }
    );
  }
}
