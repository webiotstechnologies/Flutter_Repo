import 'package:get/get.dart';
import 'common/app_fonts.dart';
import 'controllers/app_controller.dart';
export 'package:get/get_navigation/src/routes/get_route.dart';
export 'package:multi_listing/common/routs/rout_name.dart';
export 'package:multi_listing/screens/app_pages/home_screen.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:multi_listing/common/routs/rout_method.dart';
export 'package:multi_listing/config.dart';
export 'package:multi_listing/screens/gridview_page/gridview_screen.dart';
export 'package:multi_listing/screens/listview_page/listview_screen.dart';
export 'package:multi_listing/common/routs/index.dart';
export 'package:multi_listing/common/extension/text_style_extensions.dart';
export 'package:multi_listing/common/extension/widget_extension.dart';
export '../common/theme/app_css.dart';
export 'package:multi_listing/common/assets/index.dart';
export 'package:multi_listing/common/extension/spacing.dart';
export 'package:multi_listing/widgets/listview_list_common.dart';
export '../../controllers/home_controller.dart';
export '../../widgets/sorting_button_common.dart';
export '../../widgets/text_field.dart';
export 'package:get/get.dart';
export '../common/assets/index.dart';
export '../../widgets/gridview_list_common.dart';
export '../../widgets/no_result_common.dart';
export '../screens/app_pages/layout/colors_common.dart';
export '../screens/app_pages/layout/size_common.dart';
export 'package:multi_listing/screens/app_pages/splash_screen.dart';
export 'package:multi_listing/controllers/splash_controller.dart';
export 'package:get_storage/get_storage.dart';
export 'package:multi_listing/widgets/title_size_common.dart';
export 'package:multi_listing/widgets/buy_button_common.dart';
export 'package:multi_listing/widgets/image_common.dart';

final appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());

AppFonts appFonts = AppFonts();
