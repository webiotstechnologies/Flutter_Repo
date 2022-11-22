import '../config.dart';

class ProductLists extends StatelessWidget {
  final dynamic data;

  const ProductLists({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            child: Column(children: [
      Row(children: [
        Stack(
            alignment: appCtrl.isRTL || appCtrl.languageVal == "ar"
                ? Alignment.topLeft
                : Alignment.topRight,
            children: [
              // Image
              ImageCommon(title: data["image"]).paddingAll(Insets.i10),
              // Heart Icon
              const HeartImageCommon().paddingOnly(
                  right: Insets.i18,
                  top: Insets.i18,
                  left: appCtrl.isRTL || appCtrl.languageVal == "ar"
                      ? Insets.i18
                      : 0)
            ]),
        const HSpace(Sizes.s10),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title & Size Layout
              TitleSizeCommon(
                  title: data["title"].toString().tr,
                  size: data["size"].toString().tr),
              const VSpace(Sizes.s20),
              // OutfitAwesome Text
              SizedBox(
                  width: Sizes.s200,
                  child: Text(appFonts.outfitIsAwesome.tr,
                      overflow: TextOverflow.fade,
                      style: AppCss.montserratSemiBold14
                          .textColor(appCtrl.appTheme.lightBlack))),
              const VSpace(Sizes.s20),
              // Price And Buy Button
              PriceBuyCommon(
                  title: appCtrl.priceSymbol +
                      (appCtrl.currencyVal *
                              double.parse(data["price"].toString()))
                          .toStringAsFixed(2))
            ])
      ])
    ])).inkWell(onTap: ()=> Get.toNamed(routeName.productScreen,arguments: data))
        .decorated(
            color: appCtrl.appTheme.whiteColor,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 3),
                  color: appCtrl.appTheme.indigoShade,
                  blurRadius: 2)
            ],
            borderRadius:
                const BorderRadius.all(Radius.circular(AppRadius.r20)))
        .paddingOnly(bottom: Insets.i10);
  }
}