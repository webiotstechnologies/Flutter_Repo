import '../../config.dart';

class VideoScreen extends StatelessWidget {
  final videoCtrl = Get.put(VideoController());

  VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(builder: (videoCtrl) {
      return Scaffold(
          appBar: AppBar(title: Text("Video From ${videoCtrl.title}")),
          body: videoCtrl.controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: videoCtrl.controller!.value.aspectRatio,
                  child: VideoPlayer(videoCtrl.controller!))
              : Container());
    });
  }
}
