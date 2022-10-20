import 'package:authentication_repo/validation_form/text_field_validation_common.dart';

import '../../config.dart';

class OtpScreen extends StatelessWidget {
  final otpCtrl = Get.put(OtpController());

  OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(builder: (_) {
      return Scaffold(
          body: Form(
              key: otpCtrl.otpGlobalKey,
              child: otpCtrl.isLoading ? const AlertDialogBox() : Column(children: [
                // Number Text
                Text("+91 ${otpCtrl.data[0]}",
                        style: AppCss.montserratSemiBold16)
                    .paddingOnly(bottom: Insets.i30),
                // Otp Field Layout
                OtpLayout(
                    validator: (value)=> Validation().otpValidation(value),
                    controller: otpCtrl.otpController,
                    onSubmitted: (val) {
                      otpCtrl.otpController.text = val;
                    }),
                // Continue Button
                ButtonCommon(
                    title: appFonts.continueTo,
                    onTap: ()=> otpCtrl.onOtpMethod())
              ]).paddingSymmetric(
                  horizontal: Insets.i30, vertical: Insets.i80)));
    });
  }
}
