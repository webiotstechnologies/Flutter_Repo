


import '../config.dart';


class PaymentInformation extends StatelessWidget {
  final String? image;
  final String? paymentStatus;
  final String? description;
  final String? amount;
  final String? paymentMethod;

  const PaymentInformation(
      {Key? key,
      this.image,
      this.amount,
      this.paymentMethod,
      this.description,
      this.paymentStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Image
      Image.asset(image!, scale: 4)
          .paddingOnly(top: Insets.i50, bottom: Insets.i30),
      // Payment status
      Text(paymentStatus!,
              style: AppCss.montserratExtraBold18
                  .textColor(appCtrl.appTheme.indigo))
          .paddingOnly(bottom: Insets.i20),
      // Description
      Text(description!,
              style: AppCss.montserratSemiBold12
                  .textColor(appCtrl.appTheme.borderGray))
          .paddingOnly(bottom: Insets.i5),
      // Transaction detail
      Text(appFonts.detailOfTran,
              style: AppCss.montserratSemiBold12
                  .textColor(appCtrl.appTheme.borderGray))
          .paddingOnly(bottom: Insets.i20),
      Divider(thickness: 2, color: appCtrl.appTheme.greyShade)
          .paddingOnly(bottom: Insets.i15),
      // Transaction number
      Text(appFonts.transactionNumber,
              style:
                  AppCss.montserratSemiBold12.textColor(appCtrl.appTheme.blue))
          .paddingOnly(bottom: Insets.i15),
      Divider(thickness: 2, color: appCtrl.appTheme.greyShade)
          .paddingOnly(bottom: Insets.i25),
       CommonColumn(amount: amount,paymentMethod: paymentMethod),
    ]);
  }
}
