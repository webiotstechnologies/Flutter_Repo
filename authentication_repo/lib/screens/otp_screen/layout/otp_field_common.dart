import '../../../config.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      // Otp Common Property
      Container(
          width: Sizes.s56,
          height: Sizes.s3,
          decoration: BoxDecoration(
              color: appCtrl.appTheme.indigo,
              borderRadius: BorderRadius.circular(8)))
    ]);
  }
}
