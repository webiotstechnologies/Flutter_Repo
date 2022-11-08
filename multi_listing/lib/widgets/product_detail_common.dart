import 'package:flutter/cupertino.dart';
import '../config.dart';

class ProductDetailCommon extends StatelessWidget {
  final dynamic data;

  const ProductDetailCommon({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title and wishlist heart button
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(data["title"], style: AppCss.montserratSemiBold20),
          Icon(CupertinoIcons.heart_fill, color: appCtrl.appTheme.error)
        ]).paddingOnly(bottom: Insets.i10),

        //size and rating
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Size: ${data["size"]}", style: AppCss.montserratSemiBold14),
          Row(children: [
            Icon(Icons.star,
                size: Sizes.s15, color: appCtrl.appTheme.themeColor),
            Text(appFonts.rating, style: AppCss.montserratSemiBold14)
          ])
        ]),

        //price
        Text(appCtrl.priceSymbol + data["price"].toString(),
                style: AppCss.montserratExtraBold18
                    .textColor(appCtrl.appTheme.indigo))
            .paddingSymmetric(vertical: Insets.i30),
        Text(appFonts.description, style: AppCss.montserratExtraBold18)
            .paddingOnly(bottom: Insets.i10),

        //description
        Text(data["description"],
            style: AppCss.montserratMedium16),
      ],
    );
  }
}
