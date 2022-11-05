import '../config.dart';

class ColorLayoutCommon extends StatelessWidget {
  const ColorLayoutCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(appFonts.color, style: AppCss.montserratSemiBold16),
            ColorsCommon(
                color: appCtrl.appTheme.blue,
                selectIndex: homeCtrl.colorIndex,
                index: 0,
                onTap: () {
                  homeCtrl.color = "blue";
                  homeCtrl.onColorChange(0);
                  homeCtrl.onFinal(homeCtrl.searchController.text, homeCtrl.gender,homeCtrl.size,"blue",);
                  homeCtrl.update();
                }),
            ColorsCommon(
                color: appCtrl.appTheme.pink,
                selectIndex: homeCtrl.colorIndex,
                index: 1,
                onTap: () {
                  homeCtrl.color = "pink";
                  homeCtrl.onColorChange(1);
                  homeCtrl.onFinal(homeCtrl.searchController.text, homeCtrl.gender,homeCtrl.size,"pink",);
                  homeCtrl.update();
                }),
            ColorsCommon(
                color: appCtrl.appTheme.blackColor,
                selectIndex: homeCtrl.colorIndex,
                index: 2,
                onTap: () {
                  homeCtrl.color = "black";
                  homeCtrl.onColorChange(2);
                  homeCtrl.onFinal(homeCtrl.searchController.text, homeCtrl.gender,homeCtrl.size,"black",);
                  homeCtrl.update();
                }),
            ColorsCommon(
                color: appCtrl.appTheme.whiteColor,
                selectIndex: homeCtrl.colorIndex,
                index: 3,
                onTap: () {
                  homeCtrl.color = "white";
                  homeCtrl.onColorChange(3);
                  homeCtrl.onFinal(homeCtrl.searchController.text, homeCtrl.gender,homeCtrl.size,"white",);
                  homeCtrl.update();
                }),
          ],
        ).paddingSymmetric(vertical: Insets.i15);
      }
    );
  }
}
