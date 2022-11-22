import '../config.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  AppTheme get appTheme => _appTheme;
  final storage = GetStorage();
  String languageVal = "in";
  String priceSymbol = "\$";
  bool isRTL = false;
  double currencyVal = double.parse(appArray.currencyList[0]['INR'].toString());

  //update theme
  updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }


}
