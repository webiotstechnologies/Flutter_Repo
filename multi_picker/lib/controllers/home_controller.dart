import 'dart:io';
import 'package:video_player/video_player.dart';

import '../config.dart';

class HomeController extends GetxController {
  VideoPlayerController? videoPlayerController;
  VideoPlayerController? cameraVideoPlayerController;
  ImagePicker picker = ImagePicker();

  File? image;
  File? video;


  // Get Image from Gallery & Camera Method
  Future pickImage(source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemp = File(image.path);
    this.image = imageTemp;
    update();
    Get.back();
  }

  // Get Video From Gallery & Camera
  Future pickVideo() async {
    XFile? pickedFile = (await picker.pickVideo(source: ImageSource.gallery)) ;
    video = File(pickedFile!.path);
    videoPlayerController = VideoPlayerController.file(video!)..initialize().then((_) {
      videoPlayerController!.play();

      update();
      Get.back();
    });
  }

  // Get Video From Gallery & Camera
  Future pickVideoCamera() async {
    XFile? pickedFile = await picker.pickVideo(source: ImageSource.camera) ;
    video = File(pickedFile!.path);
    cameraVideoPlayerController = VideoPlayerController.file(video!)..initialize().then((_) {
      cameraVideoPlayerController!.play();
      update();
      Get.back();
    });
  }
 @override
  void onClose() {
    videoPlayerController!.dispose();
    cameraVideoPlayerController!.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
