import 'package:chewie/chewie.dart';

import '../../config.dart';

class VideoScreen extends StatelessWidget {
  final videoCtrl = Get.put(VideoController());

  VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(builder: (videoCtrl) {
      return WillPopScope(
        onWillPop: ()async {
          videoCtrl.controller?.dispose();
          videoCtrl.controller?.videoPlayerController.dispose();
          return true;
        },
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: appCtrl.appTheme.indigo,
                title: Text("Video From ${videoCtrl.title}")),
            body:  Center(
              // Selected From Device Video
              child: videoCtrl.controller != null?  videoCtrl.controller!.videoPlayerController.value.isInitialized
                  ? Chewie(controller: videoCtrl.controller!)
                  : const CircularProgressIndicator() : Container(),
            )),
      );
    });
  }
}
