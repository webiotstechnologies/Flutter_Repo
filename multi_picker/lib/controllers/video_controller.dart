import 'package:chewie/chewie.dart';
import '../config.dart';

class VideoController extends GetxController {
   ChewieController? controller;
  String? title;

  @override
  void onReady() {
    dynamic data = Get.arguments;
    title = data["source"];
    controller = data["controller"];
    update();
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    controller?.dispose();
    controller?.videoPlayerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}