import 'dart:io';
import '../config.dart';

class VideoController extends GetxController {
  File? video;
  VideoPlayerController? controller;
  String? title;

  @override
  void onReady() {
    dynamic data = Get.arguments;
    title = data["source"];
    video = data["video"];
    controller = data["controller"];
    update();
    // TODO: implement onReady
    super.onReady();
  }
}