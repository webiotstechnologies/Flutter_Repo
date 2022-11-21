import '../config.dart';

class PriceBuyCommon extends StatelessWidget {
  final String? title;

  const PriceBuyCommon({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Buy Button List
        Column(children: [
      SizedBox(
          height: Sizes.s30,
          width: Sizes.s190,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(title!,
                style: AppCss.montserratSemiBold16
                    .textColor(appCtrl.appTheme.indigo)),
            Text(appFonts.buy.tr,
                    textAlign: TextAlign.center,
                    style: AppCss.montserratSemiBold14
                        .textColor(appCtrl.appTheme.whiteColor))
                .paddingSymmetric(horizontal: Insets.i18, vertical: Insets.i8)
                .decorated(
                    color: appCtrl.appTheme.indigo,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppRadius.r20)))
          ]))
    ]);
  }
}
