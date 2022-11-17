import '../config.dart';

class ButtonCommon extends StatelessWidget {
  final IconData? icon;
  final GestureTapCallback? onTap;

  const ButtonCommon({Key? key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Media Buttons
            child: Icon(icon, size: 30, color: appCtrl.appTheme.whiteColor)
                .paddingSymmetric(vertical: Insets.i30, horizontal: Insets.i50)
                .decorated(
                    color: appCtrl.appTheme.indigo,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(4, 4),
                          color: appCtrl.appTheme.indigoShade,
                          blurRadius: 2)
                    ],
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppRadius.r10))))
        .inkWell(onTap: onTap);
  }
}
