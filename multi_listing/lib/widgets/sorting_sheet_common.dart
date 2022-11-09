import '../config.dart';

class SortingBottomSheetCommon extends StatelessWidget {
  const SortingBottomSheetCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            // Sort Text
            Text(appFonts.sort, style: AppCss.montserratSemiBold18),
            // Low To High Text
            Text(appFonts.lowToHigh, style: AppCss.montserratExtraBold15)
                .inkWell(
                    onTap: () => homeCtrl.onFinal(
                        homeCtrl.searchController.text, true, false))
                .paddingSymmetric(vertical: Insets.i20),
            // High To Low Text
            Text(appFonts.highToLow, style: AppCss.montserratExtraBold15)
                .inkWell(
                    onTap: () => homeCtrl.onFinal(
                        homeCtrl.searchController.text, true, true))
          ]).paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i20))
          .decorated(
              color: appCtrl.appTheme.whiteColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(AppRadius.r20),
                  topLeft: Radius.circular(AppRadius.r20)))
          .height(MediaQuery.of(context).size.height * 0.2);
    });
  }
}
