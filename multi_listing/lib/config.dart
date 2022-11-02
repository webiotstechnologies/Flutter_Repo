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
export 'package:multi_listing/widgets/button_common.dart';
export 'package:multi_listing/screens/gridview_page/gridview_screen.dart';
export 'package:multi_listing/screens/listview_page/listview_screen.dart';
export 'package:multi_listing/common/routs/index.dart';
export 'package:multi_listing/common/extension/text_style_extensions.dart';
export 'package:multi_listing/common/extension/widget_extension.dart';
export '../common/theme/app_css.dart';
export 'package:multi_listing/common/assets/index.dart';
export 'package:multi_listing/common/extension/spacing.dart';

final appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());

AppFonts appFonts = AppFonts();
