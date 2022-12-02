import '../../config.dart';


class PaymentSuccess extends StatelessWidget {
  final successCtrl = Get.put(SuccessController());

  PaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SuccessController>(builder: (successCtrl) {
      return Scaffold(
          backgroundColor: appCtrl.appTheme.whiteColor,
          appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: appCtrl.appTheme.indigo,
              title: Text(appFonts.paymentSuccessful,
                  style: AppCss.montserratSemiBold18)),
          body: Center(
              // Payment Info
              child: PaymentInformation(
                  image: eImageAssets.success,
                  amount: successCtrl.amountController.text,
                  paymentMethod: successCtrl.payment == "razor"
                      ? "Razor Pay"
                      : successCtrl.payment == "stripe"
                          ? "Stripe Pay"
                          : successCtrl.payment == "paypal"
                              ? "Paypal"
                              : "",
                  paymentStatus: appFonts.paymentSuccessful,
                  description: appFonts.yourPayment)));
    });
  }
}
