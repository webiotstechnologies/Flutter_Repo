
import '../config.dart';

class ButtonCommon extends StatelessWidget {
  final String? title;
  final GestureTapCallback? onTap;

  const ButtonCommon({Key? key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Common button
    return Container(
            alignment: Alignment.center,
            child: Text(title!,
                style: AppCss.montserratSemiBold16
                    .textColor(appCtrl.appTheme.whiteColor)))
        .inkWell(onTap: onTap)
        .height(Sizes.s50)
        .width(double.infinity)
        .decorated(
            color: appCtrl.appTheme.indigo,
            borderRadius:
                const BorderRadius.all(Radius.circular(AppRadius.r5)));
  }
}
