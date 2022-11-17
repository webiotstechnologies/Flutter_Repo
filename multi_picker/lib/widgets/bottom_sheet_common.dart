import '../config.dart';

class BottomSheetCommon extends StatelessWidget {
  final String? title;
  final String? firstImage;
  final String? secondImage;
  final String? firstName;
  final String? secondName;
  final GestureTapCallback? fistOnTap;
  final GestureTapCallback? secondOnTap;

  const BottomSheetCommon(
      {Key? key,
      this.title,
      this.firstImage,
      this.firstName,
      this.fistOnTap,
      this.secondImage,
      this.secondName,
      this.secondOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            // Choose Image Text
            Text(title!, style: AppCss.montserratExtraBold18),
            Row(children: [
              // Gallery Icon And Text
              Column(children: [
                Image.asset(firstImage!, scale: 10)
                    .paddingOnly(top: Insets.i15, bottom: Insets.i10),
                Text(firstName!, style: AppCss.montserratSemiBold14)
              ]).paddingOnly(right: Insets.i30).inkWell(onTap: fistOnTap),
              // Camera Icon And camera
              Column(children: [
                Image.asset(secondImage!, scale: 10)
                    .paddingOnly(top: Insets.i15, bottom: Insets.i10),
                Text(secondName!, style: AppCss.montserratSemiBold14)
              ]).inkWell(onTap: secondOnTap)
            ])
          ]).paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i15))
          .decorated(
              color: appCtrl.appTheme.whiteColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(AppRadius.r20),
                  topLeft: Radius.circular(AppRadius.r20)))
          .height(MediaQuery.of(context).size.height * 0.2);
    });
  }
}
