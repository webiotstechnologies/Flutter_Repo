import '../config.dart';

class RecordingButton extends StatelessWidget {
  final String? eTitle;
  final VoidCallback? onPressed;
  final String? title;

  const RecordingButton({Key? key, this.title, this.onPressed, this.eTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // All Button Common Layout
    return Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(children: [
              ElevatedButtonCommon(title: eTitle, onPressed: onPressed),
              const HSpace(Sizes.s20),
              Text(title!, style: AppCss.montserratSemiBold16)
            ]).paddingSymmetric(vertical: Insets.i20, horizontal: Insets.i10))
        .decorated(
            color: appCtrl.appTheme.indigoShade,
            border: Border.all(color: Colors.indigo, width: 3))
        .paddingSymmetric(horizontal: Insets.i20);
  }
}
