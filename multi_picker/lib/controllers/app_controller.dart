
import '../common/theme/app_theme.dart';
import '../config.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  AppTheme get appTheme => _appTheme;
  bool isTheme = false;
  String languageVal = "in";
  String priceSymbol = "\$";


  onBottomSheetOpen (bool isBottom) {
        Get.bottomSheet(isBottom == true ? const ImageBottomSheet() : const VideoBottomSheet());
  }

  //update theme
  updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }

}
