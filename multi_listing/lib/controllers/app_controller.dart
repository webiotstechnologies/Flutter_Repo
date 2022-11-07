import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_listing/widgets/filter_sheet_common.dart';
import 'package:multi_listing/widgets/sorting_sheet_common.dart';

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

  // Sorting BottomSheet
  sortingBottomSheet (){
    Get.bottomSheet(const SortingBottomSheetCommon());
  }

  // Filter BottomSheet
  filterBottomSheet () {
    Get.bottomSheet(const FilterBottomSheetCommon());
  }

  //update theme
  updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }

}
