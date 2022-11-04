import '../config.dart';
import '../screens/app_pages/layout/colors_common.dart';
import '../screens/app_pages/layout/gender_common.dart';
import '../screens/app_pages/layout/size_common.dart';

class FilterBottomSheetCommon extends StatelessWidget {
  const FilterBottomSheetCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Text(appFonts.filter, style: AppCss.montserratSemiBold18)
                .paddingOnly(bottom: Insets.i10),
            const Divider(thickness: 2),
            Row(children: [
              Text(appFonts.gender, style: AppCss.montserratSemiBold16),
              GenderCommon(
                      title: appFonts.male,
                      index: 0,
                      selectIndex: homeCtrl.selectIndex)
                  .inkWell(onTap: () {
                homeCtrl.onGenderChange(0);
                homeCtrl.onMale();
                homeCtrl.update();
              })
                  .paddingSymmetric(horizontal: Insets.i80),
              GenderCommon(
                      title: appFonts.female,
                      index: 1,
                      selectIndex: homeCtrl.selectIndex)
                  .inkWell(onTap: () {
                homeCtrl.onGenderChange(1);
                homeCtrl.onFemale();
                homeCtrl.update();
              })
            ]).paddingSymmetric(vertical: Insets.i15),
            const Divider(thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(appFonts.size2, style: AppCss.montserratSemiBold16),
                SizeCommon(title: appFonts.s),
                SizeCommon(title: appFonts.l),
                SizeCommon(title: appFonts.m),
                SizeCommon(title: appFonts.xl),
              ],
            ).paddingSymmetric(vertical: Insets.i15),
            const Divider(thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(appFonts.color, style: AppCss.montserratSemiBold16),
                ColorsCommon(color: appCtrl.appTheme.blue),
                ColorsCommon(color: appCtrl.appTheme.pink),
                ColorsCommon(color: appCtrl.appTheme.blackColor),
                ColorsCommon(color: appCtrl.appTheme.whiteColor),
              ],
            ).paddingSymmetric(vertical: Insets.i15)
          ]).paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i20))
          .decorated(
              color: appCtrl.appTheme.greyShade,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(AppRadius.r20),
                  topLeft: Radius.circular(AppRadius.r20)))
          .height(MediaQuery.of(context).size.height * 0.38);
    });
  }
}
