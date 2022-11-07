import '../config.dart';

class SortingButton extends StatelessWidget {
  final IconData? icon;
  final String? title;


  const SortingButton({Key? key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // Icon
      Icon(icon, size: Sizes.s18, color: appCtrl.appTheme.whiteColor)
          .paddingOnly(right: Insets.i10),
      // Title Text
      Text(title!,
          style: AppCss.montserratSemiBold14
              .textColor(appCtrl.appTheme.whiteColor))
    ]).paddingSymmetric(horizontal: Insets.i50, vertical: Insets.i10).decorated(
        color: appCtrl.appTheme.indigo,
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r30)));
  }
}
