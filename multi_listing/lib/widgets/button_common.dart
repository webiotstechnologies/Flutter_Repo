import '../config.dart';

class ButtonCommon extends StatelessWidget {
  final String? title;
  const ButtonCommon({Key? key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Bottom Button Common
        child: Text(title!,
            style: AppCss.montserratSemiBold14
                .textColor(
                appCtrl.appTheme.whiteColor))
            .paddingSymmetric(
            vertical: Insets.i15,
            horizontal: Insets.i50)
            .decorated(
            color: appCtrl.appTheme.indigo,
            borderRadius: const BorderRadius.all(
                Radius.circular(AppRadius.r30))));
  }
}
