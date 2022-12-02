import 'dart:core';
import '../../config.dart';

class PaypalPayment extends StatelessWidget {
  final paymentMethodCtrl = Get.put(PaymentMethodController());
  final Function onFinish;

  PaypalPayment({Key? key, required this.onFinish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (paymentMethodCtrl.checkoutUrl != null) {
      return GetBuilder<PaymentMethodController>(builder: (context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: appCtrl.appTheme.indigo,
                leading: const BackButton()),
            // Start payment process
            body: WebView(
                initialUrl: paymentMethodCtrl.checkoutUrl,
                javascriptMode: JavascriptMode.unrestricted,
                navigationDelegate: (NavigationRequest request) {
                  if (request.url.contains(paymentMethodCtrl.returnURL)) {
                    final uri = Uri.parse(request.url);
                    final payerID = uri.queryParameters['PayerID'];
                    if (payerID != null) {
                      paymentMethodCtrl.services
                          .executePayment(paymentMethodCtrl.executeUrl, payerID,
                              paymentMethodCtrl.accessToken)
                          .then((id) {
                        onFinish(id);
                      });
                    } else {
                      Get.back();
                    }
                    Get.back();
                  }
                  if (request.url.contains(paymentMethodCtrl.cancelURL)) {
                    Get.back();
                  }
                  return NavigationDecision.navigate;
                }));
      });
    } else {
      return Scaffold(
          key: paymentMethodCtrl.scaffoldKey,
          appBar: AppBar(
              leading: const BackButton(),
              backgroundColor: appCtrl.appTheme.blackColor,
              elevation: 0.0),
          body: const Center(child: CircularProgressIndicator()));
    }
  }
}
