import '../../config.dart';
import 'layout/otp_layout.dart';

class OtpScreen extends StatelessWidget {
  final otpCtrl = Get.put(OtpController());

  OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(builder: (_) {
      return Scaffold(
        body: Form(
          key: otpCtrl.otpGlobalKey,
          child: Column(children: [
            Text("+91 ${otpCtrl.data[0]}", style: AppCss.montserratSemiBold16)
                .paddingOnly(bottom: Insets.i30),
            OtpLayout(
                validator: (value) {
                  if (value!.isEmpty) {
                    return (appFonts.pleaseEnterValue);
                  }
                  if (!otpCtrl.regex.hasMatch(value)) {
                    return (appFonts.pleaseEnterValid);
                  }
                  return null;
                },
                controller: otpCtrl.otpController,
                onSubmitted: (val) {
                  otpCtrl.otpController.text = val;
                }),
            ButtonCommon(
                title: appFonts.continueTo,
                onTap: () async {
                  if (otpCtrl.otpGlobalKey.currentState!.validate()) {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: otpCtrl.data[1],
                              smsCode: otpCtrl.otpController.text.toString());
                      await otpCtrl.auth.signInWithCredential(credential);

                      Get.toNamed(routeName.homeScreen);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(seconds: 3),
                          content: Text(appFonts.invalidCode,
                              style: AppCss.montserratMedium16
                                  .textColor(appCtrl.appTheme.whiteColor)),
                          backgroundColor: appCtrl.appTheme.error));
                    }
                  }
                })
          ]).paddingSymmetric(horizontal: Insets.i30, vertical: Insets.i80),
        ),
      );
    });
  }
}
