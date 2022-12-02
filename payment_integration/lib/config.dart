import 'package:get/get.dart';
import 'common/app_array.dart';
import 'common/app_fonts.dart';
import 'controller/app_controller.dart';
export 'package:get_storage/get_storage.dart';
export '../common/theme/app_theme.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export '../../controller/app_controller.dart';
export 'package:google_fonts/google_fonts.dart';

export '../screens/app_pages/home_screen.dart';

export '../common/theme/app_css.dart';

export '../../widgets/alert_dialog_common.dart';
export '../../widgets/amount_box.dart';
export '../../widgets/button_common.dart';
export '../../common/assets/index.dart';
export '../../widgets/payment_common.dart';

export '../common/extension/spacing.dart';

export 'package:webview_flutter/webview_flutter.dart';
export 'package:razorpay_flutter/razorpay_flutter.dart';
export '../screens/app_pages/paypal_services.dart';

export '../../controller/failed_controller.dart';
export '../../controller/success_controller.dart';
export 'package:payment_integration/routes/index.dart';
export '../screens/app_pages/paypal_payment.dart';
export '../screens/app_pages/payment_failed.dart';
export '../screens/app_pages/payment_method_screen.dart';
export '../screens/app_pages/payment_success.dart';
export 'package:payment_integration/routes/route_name.dart';
export '../../controller/home_controller.dart';
export '../../widgets/text_field.dart';
export '../../widgets/textfield_validations.dart';
export 'package:payment_integration/common/extension/text_style_extensions.dart';
export '../../controller/payment_method_controller.dart';
export 'package:payment_integration/common/extension/widget_extension.dart';
export 'package:payment_integration/widgets/row_common.dart';
export 'package:payment_integration/widgets/common_column.dart';

final appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());

AppFonts appFonts = AppFonts();
AppArray appArray = AppArray();