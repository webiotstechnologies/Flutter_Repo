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
          // Image
          ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppRadius.r20)),
                  child: Image.asset(data["image"],
                      height: Sizes.s140, fit: BoxFit.cover, width: Sizes.s120))
              .paddingAll(Insets.i10),
          // Heart Icon
          const HeartImageCommon()
              .paddingOnly(right: Insets.i18, top: Insets.i18)
        ]),
        const HSpace(Sizes.s10),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          // Title & Size Layout
            TitleSizeCommon(title: data["title"],size: data["size"]),
          const VSpace(Sizes.s20),
          // OutfitAwesome Text
          Text(appFonts.outfitIsAwesome,
              style: AppCss.montserratSemiBold14
                  .textColor(appCtrl.appTheme.lightBlack)),
          const VSpace(Sizes.s20),
          // Price
          Row(
              children: [
            Text("${appCtrl.priceSymbol}${data["price"].toString()}",
                style: AppCss.montserratSemiBold20
                    .textColor(appCtrl.appTheme.indigo)),
            const HSpace(Sizes.s80),
            // Buy Text
                const BuyButtonCommon()
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
                  blurRadius: 2)
            ],
            borderRadius:
                const BorderRadius.all(Radius.circular(AppRadius.r20)))
        .paddingOnly(bottom: Insets.i10);
  }
}
