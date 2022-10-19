import 'package:get/get.dart';
import 'common/ecommerce_fonts.dart';
import 'controllers/app_controller.dart';
export 'package:authentication_repo/Screens/sign_up_page/sign_up.dart';
export 'package:authentication_repo/routs/rout_method.dart';
export 'package:flutter/material.dart';
export 'package:get/get_navigation/src/root/get_material_app.dart';
export '../../common/extension/spacing.dart';
export '../../common/theme/app_css.dart';
export 'package:authentication_repo/common/extension/text_style_extensions.dart';
export 'package:get/get.dart';
export 'package:authentication_repo/Screens/sign_up_page/sign_up.dart';
export 'package:authentication_repo/routs/rout_name.dart';
export 'package:get/get_navigation/src/routes/get_route.dart';
export '../Screens/Login_page/sign_in_screen.dart';
export 'package:authentication_repo/controllers/sign_up_controller.dart';
export 'package:authentication_repo/widgets/text_field_common.dart';
export '../../../routs/index.dart';
export '../../../widgets/button_common.dart';
export 'package:authentication_repo/common/assets/index.dart';
export 'package:authentication_repo/common/extension/widget_extension.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:authentication_repo/Screens/sign_up_page/layout/google_method.dart';
export 'package:authentication_repo/controllers/facebook_controller.dart';
export 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
export 'package:authentication_repo/Screens/facebook_login_page/layout/facebook_login_method.dart';
export 'package:authentication_repo/Screens/Login_page/layout/login_layout.dart';
export 'package:authentication_repo/Screens/facebook_login_page/layout/fb_logout_layout.dart';
export 'package:authentication_repo/controllers/otp_controller.dart';

final appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());

AppFonts appFonts = AppFonts();