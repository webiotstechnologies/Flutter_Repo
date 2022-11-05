import '../config.dart';

class SortingBottomSheetCommon extends StatelessWidget {
  const SortingBottomSheetCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        return SizedBox(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(appFonts.sort, style: AppCss.montserratSemiBold18),
            Text(appFonts.lowToHigh,style: AppCss.montserratMedium16).inkWell(onTap: () {
              homeCtrl.onFinal(homeCtrl.searchController.text, homeCtrl.gender,homeCtrl.size,homeCtrl.color,his: false);
            }).paddingSymmetric(vertical: Insets.i20),
            Text(appFonts.highToLow,style: AppCss.montserratMedium16).inkWell(onTap: () {
              homeCtrl.onFinal(homeCtrl.searchController.text, homeCtrl.gender,homeCtrl.size,homeCtrl.color,his: true);
            }),
          ]).paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i20),
        ).decorated(
            color: appCtrl.appTheme.whiteColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppRadius.r20),
                topLeft: Radius.circular(AppRadius.r20))).height(MediaQuery.of(context).size.height * 0.2);
      }
    );
  }
}
