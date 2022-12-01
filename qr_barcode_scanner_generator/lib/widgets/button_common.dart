import '../config.dart';

class ElevatedButtonCommon extends StatelessWidget {
  final String? title;
  final GestureTapCallback? onTap;

  const ElevatedButtonCommon({Key? key, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Button Common
    return Container(
            alignment: Alignment.center,
            height: Sizes.s35,
            width: Sizes.s180,
            decoration: BoxDecoration(
                color: appCtrl.appTheme.indigo,
                boxShadow: [
                  BoxShadow(
                      color: appCtrl.appTheme.indigoShade,
                      blurRadius: 0,
                      offset: const Offset(3, 3))
                ],
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppRadius.r3))),
            child: Text(title!,
                    style: AppCss.montserratSemiBold16
                        .textColor(appCtrl.appTheme.whiteColor))
                .paddingSymmetric(horizontal: Insets.i5))
        .inkWell(onTap: onTap)
        .paddingSymmetric(vertical: Insets.i10);
  }
}
