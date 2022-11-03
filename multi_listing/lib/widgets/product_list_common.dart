import 'package:flutter/cupertino.dart';
import '../config.dart';

class ProductLists extends StatelessWidget {
  final dynamic data;

  const ProductLists({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            child: Column(children: [
      Row(children: [
        Stack(alignment: Alignment.topRight, children: [
          ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppRadius.r20)),
                  child: Image.asset(data["image"],
                      height: Sizes.s140, fit: BoxFit.cover, width: Sizes.s120))
              .paddingAll(Insets.i10),
          SizedBox(
                  child: Icon(CupertinoIcons.heart_fill,
                          color: appCtrl.appTheme.error, size: Sizes.s14)
                      .paddingAll(Insets.i4)
                      .decorated(
                          color: appCtrl.appTheme.whiteColor,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppRadius.r50))))
              .paddingOnly(right: Insets.i18, top: Insets.i18)
        ]),
        const HSpace(Sizes.s10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(data["title"],
                  style: AppCss.montserratSemiBold16
                      .textColor(appCtrl.appTheme.indigo))
              .paddingSymmetric(vertical: Insets.i5),
          Text('Size: ${data["size"]}',
              style: AppCss.montserratExtraBold11
                  .textColor(appCtrl.appTheme.lightBlack)),
          const VSpace(Sizes.s20),
          Text(appFonts.outfitIsAwesome,
              style: AppCss.montserratSemiBold14
                  .textColor(appCtrl.appTheme.lightBlack)),
          const VSpace(Sizes.s20),
          Row(children: [
            Text(data["price"],
                style: AppCss.montserratSemiBold20
                    .textColor(appCtrl.appTheme.indigo)),
            const HSpace(Sizes.s80),
            Text("Buy",
                    style: AppCss.montserratSemiBold14
                        .textColor(appCtrl.appTheme.whiteColor))
                .paddingSymmetric(horizontal: Insets.i18, vertical: Insets.i8)
                .decorated(
                    color: appCtrl.appTheme.indigo,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppRadius.r20)))
          ])
        ])
      ])
    ]))
        .decorated(
            color: appCtrl.appTheme.whiteColor,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 3),
                  color: appCtrl.appTheme.indigoShade,
                  blurRadius: 3)
            ],
            borderRadius:
                const BorderRadius.all(Radius.circular(AppRadius.r20)))
        .paddingOnly(bottom: Insets.i10);
  }
}
