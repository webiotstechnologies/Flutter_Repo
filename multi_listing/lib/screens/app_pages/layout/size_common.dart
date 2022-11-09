import '../../../config.dart';

class SizeCommon extends StatelessWidget {
  final String? title;
  final int? selectIndex;
  final int? index;
  final GestureTapCallback? onTap;

  const SizeCommon(
      {Key? key, this.title, this.index, this.selectIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
    // Text
    Text(title!,
            style: AppCss.montserratSemiBold14.textColor(selectIndex == index
                ? appCtrl.appTheme.indigo
                : appCtrl.appTheme.blackColor))
        .inkWell(onTap: onTap),
    const VSpace(Sizes.s8),
    // Indicator
    selectIndex == null
        ? Container()
        : selectIndex == index
            ? Container(
                height: 2, width: Sizes.s30, color: selectIndex == index
        ? appCtrl.appTheme.indigo
        : appCtrl.appTheme.blackColor)
            : Container()
      ]);
  }
}
