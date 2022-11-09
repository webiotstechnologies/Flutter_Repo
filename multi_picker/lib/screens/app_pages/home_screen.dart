import 'package:multi_picker/config.dart';
import 'package:video_player/video_player.dart';

import '../../widgets/elevated_button_common.dart';

class HomeScreen extends StatelessWidget {
  final homeCtrl = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: appCtrl.appTheme.indigo,
              elevation: 0,
              centerTitle: true,
              title: Text(appFonts.multiPicker,
                  style: AppCss.montserratExtraBold18)),
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              // Pick Image Button
                  ElevatedButtonCommon(title: appFonts.pickImage,onPressed: ()=> appCtrl.onBottomSheetOpen(true)),
                  ElevatedButtonCommon(title: appFonts.pickVideo,onPressed: ()=> appCtrl.onBottomSheetOpen(false)),
              homeCtrl.video != null ?
                // Selected Image
                Container(
                  child: homeCtrl.videoPlayerController!.value.isInitialized
                      ? AspectRatio(
                    aspectRatio: homeCtrl.videoPlayerController!.value.aspectRatio,
                    child: VideoPlayer(homeCtrl.videoPlayerController!),
                  )
                      : const CircularProgressIndicator(),
                ) : homeCtrl.image != null ? SizedBox(
                       height: 200,
                width: 200,
                child: Image.file(homeCtrl.image!,fit: BoxFit.cover),
              ) : Container()
            ] ),
          )
      );
    });
  }
}
