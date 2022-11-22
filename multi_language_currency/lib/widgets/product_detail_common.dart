import 'package:flutter/cupertino.dart';
import '../config.dart';

class ProductDetailCommon extends StatelessWidget {
  final dynamic data;
  final productCrl = Get.put(ProductController());

  ProductDetailCommon({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productCrl) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //title and wishlist heart button
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(width: Sizes.s250,child: Text(data["title"].toString().tr,overflow: TextOverflow.ellipsis, style: AppCss.montserratSemiBold20)),
          Icon(CupertinoIcons.heart_fill, color: appCtrl.appTheme.error)
        ]).paddingOnly(bottom: Insets.i10),

        //size and rating
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("${appFonts.size.tr} ${data["size"]}",
              style: AppCss.montserratSemiBold14),
          Row(children: [
            Icon(Icons.star,
                size: Sizes.s15, color: appCtrl.appTheme.themeColor),
            Text(appFonts.rating.tr, style: AppCss.montserratSemiBold14)
          ])
        ]),
        //price
        Text(
                productCrl.counter == 0
                    ? appCtrl.priceSymbol +
                        (appCtrl.currencyVal *
                                double.parse(data["price"].toString().tr))
                            .toStringAsFixed(2)
                    : appCtrl.priceSymbol +
                        (appCtrl.currencyVal *
                                productCrl.counter *
                                double.parse(data["price"].toString()))
                            .toStringAsFixed(2),
                style: AppCss.montserratExtraBold18
                    .textColor(appCtrl.appTheme.indigo))
            .paddingSymmetric(vertical: Insets.i30),
        Text(appFonts.description.toString().tr,
                style: AppCss.montserratExtraBold18)
            .paddingOnly(bottom: Insets.i10),
        //description
        SizedBox(
            width: double.infinity,
            height: Sizes.s150,
            child: Text(data["description"].toString().tr,
                overflow: TextOverflow.fade, style: AppCss.montserratMedium16))
      ]);
    });
  }
}
