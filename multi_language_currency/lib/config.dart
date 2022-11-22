import 'package:get/get.dart';
import 'common/app_fonts.dart';
import 'controller/app_controller.dart';
export 'package:flutter/material.dart';
export 'package:get/get_navigation/src/root/get_material_app.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export '../common/theme/app_theme.dart';
export '../common/extension/spacing.dart';
export 'package:multi_language_currency/common/extension/text_style_extensions.dart';
export 'package:multi_language_currency/common/extension/widget_extension.dart';
export 'package:multi_language_currency/widgets/title_size_common.dart';
export '../../common/theme/app_css.dart';
export '../../controller/home_controller.dart';
export '../../widgets/directional_rtl.dart';
export '../../widgets/product_list_common.dart';
export '../../widgets/buy_button_common.dart';
export '../../widgets/heart_image_common.dart';
export '../../widgets/image_common.dart';
export 'package:get/get_navigation/src/routes/get_route.dart';
export 'package:multi_language_currency/routes/route_name.dart';
export '../screens/app_pages/home_screen.dart';
export '../../controller/splash_controller.dart';
export 'package:multi_language_currency/common/assets/index.dart';
export '../routes/index.dart';
export '../screens/app_pages/splash_screen.dart';
export 'common/language/index.dart';
export 'package:multi_language_currency/widgets/language_common.dart';
export '../../widgets/currency_common.dart';
export 'package:get/get_navigation/src/root/internacionalization.dart';
export 'package:multi_language_currency/common/language/ru.dart';
export 'package:multi_language_currency/common/language/sp.dart';
export 'package:multi_language_currency/common/language/ar.dart';
export 'package:multi_language_currency/common/language/fr.dart';
export 'package:multi_language_currency/common/language/ge.dart';
export 'package:multi_language_currency/common/language/gu.dart';
export 'package:multi_language_currency/common/language/en.dart';
export 'package:multi_language_currency/common/language/hi.dart';
export 'package:multi_language_currency/common/language/ja.dart';
export 'package:multi_language_currency/common/language/ko.dart';
export '../../controller/product_controller.dart';
export '../../widgets/bottom_layout.dart';
export '../../widgets/notification_common.dart';
export '../../widgets/product_detail_common.dart';
export 'package:multi_language_currency/widgets/plus_minus_button_common.dart';
export 'package:multi_language_currency/widgets/button_common.dart';
export 'package:multi_language_currency/common/extension/text_style_extensions.dart';
export 'package:google_fonts/google_fonts.dart';
export '../../controller/app_controller.dart';


final appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());

AppFonts appFonts = AppFonts();
