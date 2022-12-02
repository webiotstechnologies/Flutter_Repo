import '../../config.dart';

class PaymentMethodScreen extends StatelessWidget {
  final paymentMethodCtrl = Get.put(PaymentMethodController());

  PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(builder: (paymentMethodCtrl) {
      return WillPopScope(
        onWillPop: () async{
          paymentMethodCtrl.nameController.clear();
          paymentMethodCtrl.amountController.clear();
          paymentMethodCtrl.emailController.clear();
          return true;
        },
        child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                backgroundColor: appCtrl.appTheme.indigo,
                title: Text(appFonts.selectPaymentMethod,
                    style: AppCss.montserratSemiBold18)),
            body: paymentMethodCtrl.isLoading
                ? const AlertDialogBox()
                : SingleChildScrollView(
                    child: Column(children: [
                      // Amount Box
                    AmountBox(amount: "₹${paymentMethodCtrl.amountController.text}"),
                    // Select  Payment
                    ...paymentMethodCtrl.paymentMethods
                        .asMap()
                        .entries
                        .map((e) => SizedBox(
                                child: ListTile(
                                    leading: Image.asset(e.value["image"],
                                            scale: 15)
                                        .paddingOnly(top: Insets.i3),
                                    title: Text(e.value["name"],
                                        style: AppCss.montserratSemiBold15),
                                    subtitle:
                                        Text(e.value["subtext"],
                                            style: AppCss.montserratSemiBold12),
                                    trailing: Radio(
                                        activeColor: appCtrl.appTheme.indigo,
                                        value: e.value["value"],
                                        groupValue: paymentMethodCtrl.payment,
                                        onChanged: (val) {
                                          paymentMethodCtrl.payment = val;
                                          paymentMethodCtrl.update();
                                        })))
                            .decorated(
                                border: Border.all(
                                    color: appCtrl.appTheme.indigoShade),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(AppRadius.r10)))
                            .paddingOnly(bottom: Insets.i10))
                        .toList(),
                    // Pay Button
                    ButtonCommon(
                        title: appFonts.pay,
                        onTap: ()=> paymentMethodCtrl.payButton())
                  ]).paddingSymmetric(
                        horizontal: Insets.i20, vertical: Insets.i20)))
      );
    });
  }
}
