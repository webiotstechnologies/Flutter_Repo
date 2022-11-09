import 'package:get/get.dart';
import 'common/app_fonts.dart';
import 'controllers/app_controller.dart';
export 'package:get/get_navigation/src/routes/get_route.dart';
export 'package:multi_picker/routs/rout_name.dart';
export 'package:multi_picker/screens/app_pages/home_screen.dart';
export 'package:flutter/material.dart';
export 'package:multi_picker/common/theme/app_css.dart';
export 'package:multi_picker/routs/rout_method.dart';
export 'package:get/get_navigation/src/root/get_material_app.dart';
export 'package:get/get.dart';
export 'package:multi_picker/controllers/home_controller.dart';
export 'package:multi_picker/common/extension/widget_extension.dart';
export 'package:image_picker/image_picker.dart';
export 'package:multi_picker/common/assets/index.dart';
export 'package:multi_picker/widgets/bottom_sheet_common.dart';
export 'package:get/get.dart';
export 'package:multi_picker/widgets/image_sheet_common.dart';
export 'package:multi_picker/widgets/video_sheet_common.dart';

final appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());

AppFonts appFonts = AppFonts();
