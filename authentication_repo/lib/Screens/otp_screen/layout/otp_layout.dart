import 'package:pinput/pinput.dart';

import '../../../config.dart';

class OtpLayout extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  const OtpLayout({Key? key,this.validator,this.controller,this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
        androidSmsAutofillMethod:  AndroidSmsAutofillMethod.smsRetrieverApi,
        length: 6,
        validator: validator,
        onSubmitted: onSubmitted,
        pinAnimationType: PinAnimationType.slide,
        controller: controller,
        defaultPinTheme: PinTheme(
            width: 56,
            height: 56,
            textStyle: TextStyle(fontSize: 22, color: appCtrl.appTheme.blackColor)),
        showCursor: true,
        cursor: Container(
            width: 56,
            height: 3,
            decoration: BoxDecoration(
              color: appCtrl.appTheme.indigo,
              borderRadius: BorderRadius.circular(8),
            )),
        preFilledWidget: Container(
            width: 56,
            height: 3,
            decoration: BoxDecoration(
              color: appCtrl.appTheme.indigo,
              borderRadius: BorderRadius.circular(8),
            )));
  }
}
