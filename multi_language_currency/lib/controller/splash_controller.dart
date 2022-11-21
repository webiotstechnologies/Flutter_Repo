import 'dart:async';
import '../config.dart';


class SplashController extends GetxController {
    @override
  void onReady() async{

      // Language Save
      Locale? locale =const Locale("en", "US");
      var language = await appCtrl.storage.read("locale") ?? const Locale("en", "US");
      if (language != null) {
        if (language == "en") {
          locale = const Locale("en", "US");
        } else if (language == "hi") {
          locale = const Locale("hi", "IN");
        } else if (language == "ar") {
          locale = const Locale("ar", "AE");
        }else if (language == "gu") {
          locale = const Locale("gu", "IN");
        }else if (language == "fr") {
          locale = const Locale("fr", "CA");
        }else if (language == "de") {
          locale = const Locale("de", "DE");
        }else if (language == "ru") {
          locale = const Locale("ru", "RU");
        }else if (language == "es") {
          locale = const Locale("es", "DO");
        }else if (language == "ko") {
          locale = const Locale("ko", "KE");
        }else if (language == "ja") {
          locale = const Locale("ja", "JP");
        }
      } else {
        locale = const Locale("en", "US");
      }

      // Currency Save
      var currency = appCtrl.storage.read("currency")  ?? appArray.currencyList[0];
      appCtrl.priceSymbol  = currency["symbol"];
      appCtrl.currencyVal = double.parse(currency["INR"].toString());

      // RTL Save
     bool isRtlSave = appCtrl.storage.read("isRtl") ?? false;
        appCtrl.isRTL = isRtlSave;

      Get.updateLocale(locale);
      appCtrl.update();
      Get.forceAppUpdate();

      Timer(const Duration(seconds: 2), () {
        Get.offAllNamed(routeName.homeScreen);
      });
    // TODO: implement onReady
    super.onReady();
  }
}