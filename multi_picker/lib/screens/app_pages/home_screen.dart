import 'package:multi_picker/config.dart';

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
              child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                // Pick Image Button
                ElevatedButtonCommon(
                    title: appFonts.pickImage,
                    onPressed: () => appCtrl.onBottomSheetOpen(true)),
                ElevatedButtonCommon(
                    title: appFonts.pickVideo,
                    onPressed: () => appCtrl.onBottomSheetOpen(false)),
                ElevatedButtonCommon(
                    title: appFonts.pickDateTime,
                    onPressed: () => appCtrl.onDateTimeSelect()),
                Text(homeCtrl.dateTime != null
                    ? '${homeCtrl.dateTime?.month}-${homeCtrl.dateTime?.day}-${homeCtrl.dateTime?.year} ${homeCtrl.dateTime?.hour}:${homeCtrl.dateTime?.minute}'
                    : "Pick Date And Time!"),

                        ElevatedButtonCommon(
                            title: appFonts.pickDate,
                            onPressed: () => appCtrl.onDateSelect()),
                        Text(homeCtrl.date != null
                            ? '${homeCtrl.date?.month}-${homeCtrl.date?.day}-${homeCtrl.date?.year}'
                            : "Pick Date!"),

                        ElevatedButtonCommon(
                            title: appFonts.pickTime,
                            onPressed: () => appCtrl.onTimeSelect()),
                        Text(homeCtrl.time != null
                            ? '${homeCtrl.time?.hour}:${homeCtrl.time?.minute}'
                            : "Pick Time!"),


                        ElevatedButtonCommon(
                            title: "Start Playing",
                            onPressed: () => homeCtrl.playAudioFromLocalStorage()),
                        if(homeCtrl.file != null)
                         Text(homeCtrl.file!.path),
                        if(homeCtrl.file != null)
                        ElevatedButtonCommon(
                            title: "Pause",
                            onPressed: () => homeCtrl.pauseAudio()),
                        if(homeCtrl.file != null)
                        ElevatedButtonCommon(
                            title: "Stop",
                            onPressed: () => homeCtrl.stopAudio()),
                        if(homeCtrl.file != null)
                        ElevatedButtonCommon(
                            title: "Resume",
                            onPressed: () => homeCtrl.resumeAudio()),

                        homeCtrl.video != null
                    ? Container(
                        child: homeCtrl.videoPlayerController!.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: homeCtrl
                                    .videoPlayerController!.value.aspectRatio,
                                child: VideoPlayer(
                                    homeCtrl.videoPlayerController!))
                            : Container())
                    : homeCtrl.camera != null
                        ? Container(
                            child: homeCtrl.cameraVideoPlayerController!.value
                                    .isInitialized
                                ? AspectRatio(
                                    aspectRatio: homeCtrl
                                        .cameraVideoPlayerController!
                                        .value
                                        .aspectRatio,
                                    child: VideoPlayer(
                                        homeCtrl.cameraVideoPlayerController!))
                                : Container())
                        : homeCtrl.image != null
                            ? Image.file(homeCtrl.image!, fit: BoxFit.cover)
                            : Container(),
              ]))));
    });
  }
}
