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
export 'package:video_player/video_player.dart';
export '../../widgets/elevated_button_common.dart';
export 'package:file_picker/file_picker.dart';
export 'package:flutter_sound/flutter_sound.dart';
export 'package:permission_handler/permission_handler.dart';
export '../screens/image_page/image_screen.dart';
export '../screens/video_page/video_screen.dart';
export 'package:multi_picker/controllers/video_controller.dart';
export '../screens/audio_page/audio_screen.dart';


final appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());

AppFonts appFonts = AppFonts();
