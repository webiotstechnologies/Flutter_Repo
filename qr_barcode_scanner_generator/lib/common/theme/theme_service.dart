import '../../config.dart';

class ThemeService {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  /// Switch theme and save to local storage
  switchTheme(loadThemeFromStorage) async {
    if (loadThemeFromStorage) {
      Get.changeThemeMode(ThemeMode.dark);
      await appCtrl.updateTheme(AppTheme.fromType(ThemeType.dark));
      appCtrl.update();
      Get.forceAppUpdate();
    } else {
      Get.changeThemeMode(ThemeMode.light);
      await appCtrl.updateTheme(AppTheme.fromType(ThemeType.light));
      appCtrl.update();
      Get.forceAppUpdate();
    }

    appCtrl.update();
  }

  AppTheme get appTheme => Get.isDarkMode
      ? AppTheme.fromType(ThemeType.dark)
      : AppTheme.fromType(ThemeType.light);
}
