import 'package:flutter/cupertino.dart';
import 'package:multi_listing/common/extension/text_extension.dart';
import '../../config.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          child: Column(children: [
        Row(children: [
          Stack(alignment: Alignment.topRight, children: [
            ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppRadius.r20)),
                    child: Image.asset(eImageAssets.blackJeansBoy,
                        height: Sizes.s140,
                        fit: BoxFit.cover,
                        width: Sizes.s120))
                .paddingAll(Insets.i10),
            Container(
              child: Icon(CupertinoIcons.heart_fill,
                      color: appCtrl.appTheme.error, size: Sizes.s14)
                  .paddingAll(Insets.i4)
                  .decorated(
                      color: appCtrl.appTheme.whiteColor,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(AppRadius.r50))),
            ).paddingOnly(right: Insets.i18, top: Insets.i18)
          ]),
          const HSpace(Sizes.s10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Black Denim Jeans",
                style: AppCss.montserratSemiBold14.textColor(appCtrl.appTheme.indigo)).paddingSymmetric(vertical: Insets.i5),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'by  ',style: AppCss.montserratSemiBold10.textColor(appCtrl.appTheme.borderGray)),
                  TextSpan(text: 'Jenish', style: AppCss.montserratExtraBold11.textColor(appCtrl.appTheme.lightBlack)),
                ],
              ),
            ),
            const VSpace(Sizes.s20),
            Text("Men Jeans For Every\nLocation.",
                style: AppCss.montserratSemiBold14.textColor(appCtrl.appTheme.lightBlack)),
            const VSpace(Sizes.s20),
            Row(children: [
              Text("\$39",
                  style: AppCss.montserratSemiBold20
                      .textColor(appCtrl.appTheme.indigo)),
              const HSpace(Sizes.s80),
              Text("Buy",
                      style: AppCss.montserratSemiBold14
                          .textColor(appCtrl.appTheme.whiteColor))
                  .paddingSymmetric(horizontal: Insets.i18, vertical: Insets.i8)
                  .decorated(
                      color: appCtrl.appTheme.indigo,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(AppRadius.r20)))
            ])
          ])
        ])
      ])).decorated(
          color: appCtrl.appTheme.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r20)))
    ]);
  }
}
