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
              // All Sizes In Map
            ...homeCtrl.sizesList.asMap().entries.map((e) => SizeCommon(
                title: e.value["size"],
                selectIndex: homeCtrl.sizeIndex,
                index: e.key,
                onTap: () {
                  homeCtrl.size = e.value["size"];
                  homeCtrl.onSizeChange(e.key);
                  homeCtrl.onFinal(homeCtrl.searchController.text,"","");
                  homeCtrl.update();
                }),).toList(),
        ]).paddingSymmetric(vertical: Insets.i15);
      }
    );
  }
}
