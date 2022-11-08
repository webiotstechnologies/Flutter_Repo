import '../common/theme/app_theme.dart';
import '../config.dart';


class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  final storage = GetStorage();
  AppTheme get appTheme => _appTheme;
  bool isTheme = false;
  String languageVal = "in";
  String priceSymbol = "\$";


  // Sorting & Filter BottomSheet
  bottomSheet (bool isBottom){
    Get.bottomSheet(isBottom == true ? const SortingBottomSheetCommon() : const FilterBottomSheetCommon());
  }

  //update theme
  updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }

}
