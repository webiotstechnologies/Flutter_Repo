import '../../../config.dart';

class OtpLayout extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;

  const OtpLayout({Key? key, this.validator, this.controller, this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Otp Field Layout
      Pinput(
          length: 6,
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
          pinAnimationType: PinAnimationType.slide,
          validator: validator,
          onSubmitted: onSubmitted,
          controller: controller,
          defaultPinTheme: PinTheme(
              width: Sizes.s56,
              height: Sizes.s56,
              textStyle: AppCss.montserratSemiBold20
                  .textColor(appCtrl.appTheme.blackColor)),
          showCursor: true,
          preFilledWidget: const OtpWidget(),
          cursor: const OtpWidget())
    ]);
  }
}
