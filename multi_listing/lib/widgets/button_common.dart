import '../config.dart';

class ButtonCommon extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? title;

  const ButtonCommon({Key? key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Common Button
    return Column(children: [
      Text(title!,
              style: AppCss.montserratSemiBold16
                  .textColor(appCtrl.appTheme.whiteColor))
          .paddingSymmetric(horizontal: Insets.i100, vertical: Insets.i12)
          .decorated(
              color: appCtrl.appTheme.indigo,
              borderRadius: const BorderRadius.all(Radius.circular(Insets.i4)))
          .inkWell(onTap: onTap)
          .paddingOnly(top: Insets.i35)
    ]);
  }
}
