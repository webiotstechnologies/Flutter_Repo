import '../../config.dart';


class PaymentFailed extends StatelessWidget {
  final failedCtrl = Get.put(FailedController());

  PaymentFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FailedController>(builder: (failedCtrl) {
      return Scaffold(
          appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: appCtrl.appTheme.indigo,
              title: Text(appFonts.paymentFailed,
                  style: AppCss.montserratSemiBold18)),
          body: Center(
              // Payment Info
              child: PaymentInformation(
                  image: eImageAssets.filed,
                  amount: failedCtrl.amountController.text,
                  paymentMethod: failedCtrl.payment == "razor"
                      ? "Razor Pay"
                      : failedCtrl.payment == "stripe"
                          ? "Stripe Pay"
                          : failedCtrl.payment == "paypal"
                              ? "Paypal"
                              : "",
                  paymentStatus: appFonts.paymentFailed,
                  description: appFonts.yourPaymentFailed)));
    });
  }
}
