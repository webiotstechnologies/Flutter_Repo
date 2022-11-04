import '../../../config.dart';

class SizeCommon extends StatelessWidget {
  final String? title;
  const SizeCommon({Key? key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(title!,style: AppCss.montserratSemiBold14,),
      const VSpace(Sizes.s8),
      Container(height: 1, width: 30, color: appCtrl.appTheme.blackColor)
    ]);
  }
}
