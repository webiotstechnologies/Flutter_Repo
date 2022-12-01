import '../config.dart';

class CurrencyButton extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  CurrencyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      // Currency Change Button
      return IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DirectionalRtl(
                      child: AlertDialog(
                          title: Text(appFonts.selectLang.tr,
                              style: AppCss.montserratSemiBold18),
                          content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: homeCtrl.currencyLists
                                  .asMap()
                                  .entries
                                  .map((e) => Row(children: [
                                        Image.asset(e.value['image'],
                                            scale: 20),
                                        Text(e.value["title"].toString().tr,
                                                style: AppCss.montserratMedium16)
                                               .paddingOnly(
                                                left: Insets.i20,
                                                top: Insets.i15)
                                            .paddingOnly(bottom: Insets.i15)
                                      ]).inkWell(onTap: ()async {
                                appCtrl.priceSymbol =
                                e.value["symbol"];
                                homeCtrl.currency = await homeCtrl.storage.read("currency");
                                if(homeCtrl.currency != e.value) {
                                  appCtrl.currencyVal = double.parse(
                                      homeCtrl.currency[e.value["code"]].toString());
                                  await homeCtrl.storage.write("currency", e.value);
                                  await homeCtrl.storage.write("currencyCode", homeCtrl.currency);
                                  homeCtrl.update();
                                  Get.forceAppUpdate();
                                }
                                Get.back();
                              })).toList())));
                });
          },
          icon: const Icon(Icons.currency_exchange, size: 20));
    });
  }
}
