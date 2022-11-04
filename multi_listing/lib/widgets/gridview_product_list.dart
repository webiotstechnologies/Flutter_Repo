import 'package:flutter/cupertino.dart';
import '../config.dart';

class GridviewList extends StatelessWidget {
  final dynamic data;
  const GridviewList({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 175,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(alignment: Alignment.topRight, children: [
                ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(AppRadius.r10)),
                    child: Image.asset(data["image"],
                        height: Sizes.s150,
                        fit: BoxFit.cover,
                        width: double.infinity))
                    .paddingOnly(top: Insets.i10, bottom: Insets.i10),
                SizedBox(
                    child: Icon(CupertinoIcons.heart_fill,
                        color: appCtrl.appTheme.error,
                        size: Sizes.s14)
                        .paddingAll(Insets.i4)
                        .decorated(
                        color: appCtrl.appTheme.whiteColor,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r50))))
                    .paddingOnly(right: Insets.i10, top: Insets.i18)
              ]),
              Text(data["title"],overflow: TextOverflow.ellipsis,
                  style: AppCss.montserratSemiBold14
                      .textColor(appCtrl.appTheme.indigo))
                  .paddingSymmetric(vertical: Insets.i5),
              Text('Size: ${data["size"]}',
                  style: AppCss.montserratExtraBold11
                      .textColor(appCtrl.appTheme.lightBlack)),
              const VSpace(Sizes.s10),
              Text(appFonts.outfitIsAwesome,
                  style: AppCss.montserratSemiBold14
                      .textColor(appCtrl.appTheme.lightBlack)),
              const VSpace(Sizes.s10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${appCtrl.priceSymbol}${data["price"].toString()}",
                        style: AppCss.montserratSemiBold20
                            .textColor(appCtrl.appTheme.indigo)),
                    Text("Buy",
                        style: AppCss.montserratSemiBold14
                            .textColor(appCtrl.appTheme.whiteColor))
                        .paddingSymmetric(
                        horizontal: Insets.i18, vertical: Insets.i8)
                        .decorated(
                        color: appCtrl.appTheme.indigo,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r20)))
                  ])
            ]).paddingSymmetric(horizontal: Insets.i10))
        .decorated(
        color: appCtrl.appTheme.whiteColor,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 3),
              color: appCtrl.appTheme.indigoShade,
              blurRadius: 2)
        ],
        borderRadius:
        const BorderRadius.all(Radius.circular(AppRadius.r10))).paddingOnly(bottom: Insets.i10);
  }
}
