
import '../config.dart';

class CommonColumn extends StatelessWidget {
  final String? amount;
  final String? paymentMethod;
  const CommonColumn({Key? key,this.amount,
    this.paymentMethod,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // Payed amount
        Text(appFonts.totalAmountPaid,
            style: AppCss.montserratExtraBold12
                .textColor(appCtrl.appTheme.borderGray)),
        Text(amount!, style: AppCss.montserratExtraBold12)
      ]),
      Divider(thickness: 2, color: appCtrl.appTheme.greyShade)
          .paddingSymmetric(vertical: Insets.i15),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // Payed merchant name
        Text(appFonts.payedBy,
            style: AppCss.montserratExtraBold12
                .textColor(appCtrl.appTheme.borderGray)),
        Text(paymentMethod!, style: AppCss.montserratExtraBold12)
      ]),
      Divider(thickness: 2, color: appCtrl.appTheme.greyShade)
          .paddingSymmetric(vertical: Insets.i15),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // Transaction date
        Text(appFonts.transactionDate,
            style: AppCss.montserratExtraBold12
                .textColor(appCtrl.appTheme.borderGray)),
        Text(appFonts.date, style: AppCss.montserratExtraBold12)
      ])
    ]).paddingSymmetric(horizontal: Insets.i20);
  }
}
