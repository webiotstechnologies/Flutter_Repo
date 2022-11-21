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
                          title: Text(appFonts.selectLang.tr),
                          content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: homeCtrl.currencyLists
                                  .asMap()
                                  .entries
                                  .map((e) => Text(
                                              e.value["title"].toString().tr,
                                              style:
                                                  AppCss.montserratSemiBold16)
                                          .inkWell(onTap: () {
                                        appCtrl.priceSymbol = e.value["symbol"];
                                        homeCtrl.currency =
                                            homeCtrl.storage.read("currency") ??
                                                homeCtrl.currencyLists[0];
                                        appCtrl.currencyVal = double.parse(
                                            homeCtrl.currency[e.value["code"]]
                                                .toString());
                                        appCtrl.update();
                                        homeCtrl.storage
                                            .write('currency', e.value);
                                        homeCtrl.storage
                                            .write('currencyCode', e.value);
                                        Get.forceAppUpdate();
                                        Get.back();
                                      }).paddingOnly(bottom: Insets.i15))
                                  .toList())));
                });
          },
          icon: const Icon(Icons.currency_exchange, size: 20));
    });
  }
}
