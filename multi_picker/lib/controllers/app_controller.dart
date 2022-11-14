import '../common/theme/app_theme.dart';
import '../config.dart';
import '../widgets/date_common.dart';
import '../widgets/date_time_common.dart';
import '../widgets/time_common.dart';


class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  AppTheme get appTheme => _appTheme;
  bool isTheme = false;
  String languageVal = "in";
  String priceSymbol = "\$";


  onBottomSheetOpen (bool isBottom) {
        Get.bottomSheet(isBottom == true ? const ImageBottomSheet() : const VideoBottomSheet());
  }

  onDateTimeSelect () {
    Get.bottomSheet(const DateTimePicker());
  }

  onDateSelect () {
    Get.bottomSheet(const DatePicker());
  }

  onTimeSelect () {
    Get.bottomSheet(const TimePicker());
  }

  //update theme
  updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }

}
