import '../../../config.dart';

class GenderCommon extends StatelessWidget {
    final String? title;
    final int? selectIndex;
    final int? index;
  const GenderCommon({Key? key,this.title,this.index,this.selectIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        return Column(
          children: [
            Text(title!, style: AppCss.montserratSemiBold16),
            const VSpace(Sizes.s8),
            selectIndex == index ? Container(height: 1, width: 30, color: appCtrl.appTheme.blackColor) : Container()
          ]
        );
      }
    );
  }
}
