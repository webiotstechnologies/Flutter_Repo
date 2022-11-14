import 'dart:io';

import '../../config.dart';
import '../../controllers/image_controller.dart';

class ImageScreen extends StatelessWidget {
  final imageCtrl = Get.put(ImageController());

  ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
              centerTitle: true, title: Text("Image From ${imageCtrl.title}")),
          body: imageCtrl.image != null
              ? Image.file(File(imageCtrl.image!.path),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity)
              : const Text("Image Not Found"));
    });
  }
}
