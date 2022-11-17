import 'package:get/get.dart';
import 'common/app_fonts.dart';
import 'controllers/app_controller.dart';

export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:barcode_widget/barcode_widget.dart';

export 'package:qr_flutter/qr_flutter.dart';
export '../../common/theme/app_css.dart';

export 'package:get/get_navigation/src/routes/get_route.dart';
export '../screens/barcode_page/barcode_screen.dart';
export '../screens/qr_code_page/qr_code_screen.dart';

export '../../widgets/text_field_common.dart';

final appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());

AppFonts appFonts = AppFonts();