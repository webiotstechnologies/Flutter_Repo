import '../config.dart';

class GenderCommon extends StatelessWidget {
  const GenderCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        return Row(children: [
          // Gender Text
          Text(appFonts.gender, style: AppCss.montserratSemiBold16),
          // All Gender In Map
          ...homeCtrl.gendersList.asMap().entries.map((e) => SizeCommon(
              title: "${e.value["gender"][0].toUpperCase()}${e.value["gender"].substring(1).toLowerCase()}",
              index: e.key,
              selectIndex: homeCtrl.selectIndex,
              onTap: () {
                homeCtrl.gender = e.value["gender"];
                homeCtrl.onGenderChange(e.key);
                homeCtrl.onFinal(homeCtrl.searchController.text,'',"");
                homeCtrl.update();
              }).paddingSymmetric(horizontal: Insets.i30)).toList(),
        ]).paddingSymmetric(vertical: Insets.i15);
      }
    );
  }
}
