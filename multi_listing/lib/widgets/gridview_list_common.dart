import '../config.dart';

class GridviewList extends StatelessWidget {
  final dynamic data;

  const GridviewList({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: Sizes.s175,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(alignment: Alignment.topRight, children: [
                // Image
                ImageCommon(
                    title: data["image"], height: Sizes.s150, width: Sizes.s150)
                    .paddingOnly(top: Insets.i10, bottom: Insets.i10),
                // Heart Icon
                const HeartImageCommon()
                    .paddingOnly(right: Insets.i10, top: Insets.i18)
              ]),
              // Title Text & Size Layout
                  TitleSizeCommon(title: data["title"],size: data["size"]),
              const VSpace(Sizes.s10),
              // Outfit Awesome Text
                  Text(appFonts.outfitIsAwesome,
                      style: AppCss.montserratSemiBold14
                          .textColor(appCtrl.appTheme.lightBlack)),
              const VSpace(Sizes.s10),
              // Price
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("${appCtrl.priceSymbol}${data["price"].toString()}",
                    style: AppCss.montserratSemiBold20
                        .textColor(appCtrl.appTheme.indigo)),
                // Buy Text
                const BuyButtonCommon()
              ])
            ]).paddingSymmetric(horizontal: Insets.i10)).inkWell(onTap: (){
      Get.toNamed(routeName.productDetailScreen,arguments: data);
    })
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
