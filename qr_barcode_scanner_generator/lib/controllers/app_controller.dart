import 'package:get/get.dart';
import '../common/theme/app_theme.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  AppTheme get appTheme => _appTheme;


  //update theme
  updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }

}
