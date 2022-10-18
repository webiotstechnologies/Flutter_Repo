import 'package:authentication_repo/controllers/otp_controller.dart';

import '../../config.dart';
import 'layout/otp_layout.dart';

class OtpScreen extends StatelessWidget {
  final otpCtrl = Get.put(OtpController());
   OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      builder: (_) {
        return Column(
          children: [
            OtpLayout(validator:(value) {

              if (value!.isEmpty) {
                return ("Please Enter Value");
              }
              if (!otpCtrl.regex.hasMatch(value)) {
                return ("Please Enter Valid Code");
              }
              return null;
            }, controller: otpCtrl.otpController,onSubmitted: (val) {
              otpCtrl.otpController.text = val;
            },)
          ],
        );
      }
    );
  }
}
