import '../config.dart';

class ColorLayoutCommon extends StatelessWidget {
  const ColorLayoutCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // Text
        Text(appFonts.color, style: AppCss.montserratSemiBold16),
        // Blue Color
        ColorsCommon(
            color: appCtrl.appTheme.blue,
            selectIndex: homeCtrl.colorIndex,
            index: 0,
            onTap: () {
              homeCtrl.color = "blue";
              homeCtrl.onColorChange(0);
              homeCtrl.onFinal(homeCtrl.searchController.text,  "", "");
              homeCtrl.update();
            }),
        // Pink Color
        ColorsCommon(
            color: appCtrl.appTheme.pink,
            selectIndex: homeCtrl.colorIndex,
            index: 1,
            onTap: () {
              homeCtrl.color = "pink";
              homeCtrl.onColorChange(1);
              homeCtrl.onFinal(homeCtrl.searchController.text, "", "");
              homeCtrl.update();
            }),
        // Black Color
        ColorsCommon(
            color: appCtrl.appTheme.blackColor,
            selectIndex: homeCtrl.colorIndex,
            index: 2,
            onTap: () {
              homeCtrl.color = "black";
              homeCtrl.onColorChange(2);
              homeCtrl.onFinal(homeCtrl.searchController.text, "", "");
              homeCtrl.update();
            }),
        // Yellow Color
        ColorsCommon(
            color: appCtrl.appTheme.themeColor,
            selectIndex: homeCtrl.colorIndex,
            index: 3,
            onTap: () {
              homeCtrl.color = "yellow";
              homeCtrl.onColorChange(3);
              homeCtrl.onFinal(homeCtrl.searchController.text, "", "");
              homeCtrl.update();
            }),
        // White Color
        ColorsCommon(
            color: appCtrl.appTheme.whiteColor,
            selectIndex: homeCtrl.colorIndex,
            index: 4,
            onTap: () {
              homeCtrl.color = "white";
              homeCtrl.onColorChange(4);
              homeCtrl.onFinal(homeCtrl.searchController.text,"", "");
              homeCtrl.update();
            })
      ]).paddingSymmetric(vertical: Insets.i15);
    });
  }
}
