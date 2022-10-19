import 'package:pinput/pinput.dart';
import '../../../config.dart';
import 'otp_field_common.dart';

class OtpLayout extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;

  const OtpLayout({Key? key, this.validator, this.controller, this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Pinput(
          length: 6,
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
          pinAnimationType: PinAnimationType.slide,
          validator: validator,
          onSubmitted: onSubmitted,
          controller: controller,
          defaultPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: AppCss.montserratSemiBold20.textColor(appCtrl.appTheme.blackColor)),
          showCursor: true,
          preFilledWidget: const OtpWidget(),
          cursor: const OtpWidget(),
        ),
      ],
    );
  }
}
