import '../config.dart';

class BuyButtonCommon extends StatelessWidget {
  const BuyButtonCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      // Buy Button List
      Text(appFonts.buy,
        style: AppCss.montserratSemiBold14
            .textColor(appCtrl.appTheme.whiteColor))
        .paddingSymmetric(
        horizontal: Insets.i18, vertical: Insets.i8)
        .decorated(
        color: appCtrl.appTheme.indigo,
        borderRadius: const BorderRadius.all(
            Radius.circular(AppRadius.r20))).marginOnly(right: Insets.i10);
  }
}
