import 'package:flutter_sound/flutter_sound.dart';
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

                Slider(
                    value: homeCtrl.songDurationInSeconds,
                    max: homeCtrl.currentPositionInSeconds,
                    min: 0,
                    onChanged: (val) {
                      homeCtrl.audioPlayer
                          ?.seek(Duration(seconds: val.toInt()));
                      val = val;
                      homeCtrl.update();
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(homeCtrl.currentPosition),
                    Text(homeCtrl.songDuration)
                  ],
                ).paddingSymmetric(horizontal: Insets.i15),

                if (homeCtrl.file != null)
                  Text(homeCtrl.file.toString().split('/').last),
                if (homeCtrl.file != null)
                  ElevatedButtonCommon(
                      title: homeCtrl.isPlaying ? "pause" : "play",
                      onPressed: () {
                        homeCtrl.isPlaying = !homeCtrl.isPlaying;
                        if (homeCtrl.isPlaying) {
                          homeCtrl.audioPlayer?.play();
                        } else {
                          homeCtrl.audioPlayer?.pause();
                        }
                        homeCtrl.update();
                      }),

                if (homeCtrl.file != null)
                  ElevatedButtonCommon(
                      title: "Stop", onPressed: () => homeCtrl.stopAudio()),

                StreamBuilder<RecordingDisposition>(
                    stream: homeCtrl.recorder.onProgress,
                    builder: (context, snapshot) {
                      final duration = snapshot.hasData
                          ? snapshot.data!.duration
                          : Duration.zero;

                      String towDigits (int n)=> n.toString().padLeft(2,'0');
                      final minutes = towDigits(duration.inMinutes.remainder(60));
                      final seconds = towDigits(duration.inSeconds.remainder(60));

                      return Text("$minutes : $seconds");
                    }),

                IconButton(
                    onPressed: () async {
                      if (homeCtrl.recorder.isRecording) {
                        await homeCtrl.stopRecording();
                      } else {
                        await homeCtrl.record();
                      }
                      homeCtrl.update();
                    },
                    icon: homeCtrl.recorder.isRecording
                        ? const Icon(Icons.stop_circle)
                        : const Icon(Icons.mic_rounded)),

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
