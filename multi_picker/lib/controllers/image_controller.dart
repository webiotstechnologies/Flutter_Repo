import '../config.dart';

class ImageController extends GetxController {
  XFile? image;
  String? title;

  @override
  void onReady() {
    dynamic data = Get.arguments;
    title = data["source"];
    image = data["image"];
    update();
    // TODO: implement onReady
    super.onReady();
  }
}
