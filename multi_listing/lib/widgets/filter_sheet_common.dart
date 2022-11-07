import 'package:multi_listing/widgets/size_layout_common.dart';

import '../config.dart';
import 'color_layout_common.dart';
import 'gender_common.dart';

class FilterBottomSheetCommon extends StatelessWidget {
  const FilterBottomSheetCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Filter Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(appFonts.filter, style: AppCss.montserratSemiBold18),
                Text(appFonts.reset,style: AppCss.montserratSemiBold18.textColor(appCtrl.appTheme.error)).inkWell(onTap: ()=> homeCtrl.onReset())
              ],
            ).paddingOnly(bottom: Insets.i10),
            const Divider(thickness: 2),
            // Gender Filter
            const GenderCommon(),
            const Divider(thickness: 2),
            // Size Filter
            const SizeLayoutCommon(),
            const Divider(thickness: 2),
            // Color Filter
            const ColorLayoutCommon()
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
