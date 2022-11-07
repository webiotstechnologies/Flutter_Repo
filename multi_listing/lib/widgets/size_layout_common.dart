import '../config.dart';

class SizeLayoutCommon extends StatelessWidget {
  const SizeLayoutCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(
      builder: (homeCtrl) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // Size Text
          Text(appFonts.size2, style: AppCss.montserratSemiBold16),
          // S Text
          SizeCommon(
              title: appFonts.s,
              selectIndex: homeCtrl.sizeIndex,
              index: 0,
              onTap: () {
                homeCtrl.size = "S";
                homeCtrl.onSizeChange(0);
                homeCtrl.onFinal(homeCtrl.searchController.text, homeCtrl.gender, "S",homeCtrl.color,"","");
                homeCtrl.update();
              }),
          // L Text
          SizeCommon(
              title: appFonts.l,
              selectIndex: homeCtrl.sizeIndex,
              index: 1,
              onTap: () {
                homeCtrl.size = "L";
                homeCtrl.onSizeChange(1);
                homeCtrl.onFinal(homeCtrl.searchController.text, homeCtrl.gender, "L",homeCtrl.color,"","");
                homeCtrl.update();
              }),
          // M Text
          SizeCommon(
              title: appFonts.m,
              selectIndex: homeCtrl.sizeIndex,
              index: 2,
              onTap: () {
                homeCtrl.size = "M";
                homeCtrl.onSizeChange(2);
                homeCtrl.onFinal(homeCtrl.searchController.text,  homeCtrl.gender, "M",homeCtrl.color,"","");
                homeCtrl.update();
              }),
          // XL Text
          SizeCommon(
              title: appFonts.xl,
              selectIndex: homeCtrl.sizeIndex,
              index: 3,
              onTap: () {
                homeCtrl.size = "XL";
                homeCtrl.onSizeChange(3);
                homeCtrl.onFinal(homeCtrl.searchController.text, homeCtrl.gender, "XL",homeCtrl.color,"","");
                homeCtrl.update();
              }),
        ]).paddingSymmetric(vertical: Insets.i15);
      }
    );
  }
}
