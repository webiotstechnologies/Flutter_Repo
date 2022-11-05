import '../../../config.dart';

class ColorsCommon extends StatelessWidget {
  final Color? color;
  final int? selectIndex;
  final int? index;
  final GestureTapCallback? onTap;
  const  ColorsCommon({Key? key, this.color,this.onTap,this.selectIndex,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 25,
          width: 25,
        ).decorated(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r50))).inkWell(onTap: onTap),
        const VSpace(Sizes.s8),
       selectIndex == index ? Container(height: 1,width: 30,color: appCtrl.appTheme.blackColor) : Container()
      ]
    );
  }
}
