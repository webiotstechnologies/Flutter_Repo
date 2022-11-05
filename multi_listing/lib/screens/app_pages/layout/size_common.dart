import '../../../config.dart';

class SizeCommon extends StatelessWidget {
  final String? title;
  final int? selectIndex;
  final int? index;
 final GestureTapCallback? onTap;
  const SizeCommon({Key? key,this.title,this.index,this.selectIndex,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(title!,style: AppCss.montserratSemiBold14).inkWell(onTap: onTap),
      const VSpace(Sizes.s8),
     selectIndex == index ? Container(height: 1, width: 30, color: appCtrl.appTheme.blackColor) : Container()
    ]);
  }
}
