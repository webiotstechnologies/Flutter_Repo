import '../../../config.dart';

class ColorsCommon extends StatelessWidget {
  final Color? color;
  final int? selectIndex;
  final int? index;
  final GestureTapCallback? onTap;

  const ColorsCommon(
      {Key? key, this.color, this.onTap, this.selectIndex, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      // Color Container
      const SizedBox(height: Sizes.s24, width: Sizes.s24)
          .decorated(
              color: color,
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppRadius.r50)))
          .inkWell(onTap: onTap),
      const VSpace(Sizes.s8),
      // Black Indicator
      selectIndex == null
          ? Container()
          : selectIndex == index
              ? Container(height: 2, width: Sizes.s30, color: appCtrl.appTheme.indigo)
              : Container()
    ]);
  }
}
