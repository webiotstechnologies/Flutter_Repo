import '../config.dart';

class GenderCommon extends StatelessWidget {
  const GenderCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        return Row(children: [
          Text(appFonts.gender, style: AppCss.montserratSemiBold16),
          SizeCommon(
              title: appFonts.male,
              index: 0,
              selectIndex: homeCtrl.selectIndex,
              onTap: () {
                homeCtrl.gender = "male";
                homeCtrl.onGenderChange(0);
                homeCtrl.onFinal(homeCtrl.searchController.text, "male",homeCtrl.size,homeCtrl.color);
                homeCtrl.update();
              }).paddingSymmetric(horizontal: Insets.i80),
          SizeCommon(
              title: appFonts.female,
              index: 1,
              selectIndex: homeCtrl.selectIndex,
              onTap: () {
                homeCtrl.gender = "female";
                homeCtrl.onGenderChange(1);
                homeCtrl.onFinal(homeCtrl.searchController.text, "female",homeCtrl.size,homeCtrl.color,);
                homeCtrl.update();
              })
        ]).paddingSymmetric(vertical: Insets.i15);
      }
    );
  }
}
