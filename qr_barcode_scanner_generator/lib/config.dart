import 'package:get/get.dart';
import 'common/app_fonts.dart';
import 'controllers/app_controller.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:barcode_widget/barcode_widget.dart';
export 'package:qr_flutter/qr_flutter.dart';
export '../../common/theme/app_css.dart';
export 'package:get/get_navigation/src/routes/get_route.dart';
export '../../widgets/text_field_common.dart';
export '../../controllers/home_controller.dart';
export '../../widgets/button_common.dart';
export 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
export '../routes/index.dart';
export '../screens/app_pages/home_screen.dart';
export '../screens/barcode_page/barcode_generate_screen.dart';
export '../screens/qr_code_page/qr_code_generate_screen.dart';
export 'package:qr_barcode_scanner_generator/routes/route_name.dart';
export 'package:qr_barcode_scanner_generator/common/extension/text_style_extensions.dart';
export 'package:qr_barcode_scanner_generator/common/extension/widget_extension.dart';
export '../../controllers/app_controller.dart';
export 'package:qr_barcode_scanner_generator/common/theme/app_theme.dart';

final appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());

AppFonts appFonts = AppFonts();