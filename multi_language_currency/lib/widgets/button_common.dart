import '../config.dart';

class ButtonCommon extends StatelessWidget {
  final String? title;
  final double? width;

  const ButtonCommon({Key? key, this.title,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Bottom Button Common
    return Container(
            alignment: Alignment.center,
            width: width,
            height: Sizes.s40,
            child: Text(title!,
                    overflow: TextOverflow.ellipsis,
                    style: AppCss.montserratSemiBold14
                        .textColor(appCtrl.appTheme.whiteColor))
                .paddingSymmetric(horizontal: Insets.i10))
        .decorated(
            color: appCtrl.appTheme.indigo,
            borderRadius:
                const BorderRadius.all(Radius.circular(AppRadius.r30)));
  }
}
