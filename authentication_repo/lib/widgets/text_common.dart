import '../config.dart';

class TextCommon extends StatelessWidget {
   final GestureTapCallback? onTap;
   final String? title;
   final String? subTitle;
  const TextCommon({Key? key,this.onTap,this.title,this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // Don's Have An Account Text
      Text(title!,
          style: AppCss.montserratMedium16
              .textColor(appCtrl.appTheme.content)),
      // SignUp Text
      Text(subTitle!,
          style: AppCss.montserratMedium16
              .textColor(appCtrl.appTheme.indigo))
          .inkWell(onTap: onTap)
    ]);
  }
}
