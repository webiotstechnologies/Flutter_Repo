import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../common/theme/app_theme.dart';


class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  final storage = GetStorage();
  AppTheme get appTheme => _appTheme;
  int selectedIndex = 0;
  bool isTheme = false;
  bool isRTL = false;
  String languageVal = "in";
  int currVal = 1;
  String priceSymbol = "\$";

  //update theme
  updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }

}
