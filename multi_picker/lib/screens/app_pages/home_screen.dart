import 'package:multi_picker/config.dart';
import 'package:multi_picker/routs/index.dart';

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

                if (homeCtrl.dateTime != null)
                  Text(
                      '${homeCtrl.dateTime?.month}-${homeCtrl.dateTime?.day}-${homeCtrl.dateTime?.year} ${homeCtrl.dateTime?.hour}:${homeCtrl.dateTime?.minute}'),

                ElevatedButtonCommon(
                    title: appFonts.pickDate,
                    onPressed: () => appCtrl.onDateSelect()),
                if(homeCtrl.date != null)
                Text('${homeCtrl.date?.month}-${homeCtrl.date?.day}-${homeCtrl.date?.year}'),

                ElevatedButtonCommon(
                    title: appFonts.pickTime,
                    onPressed: () => appCtrl.onTimeSelect()),

                if(homeCtrl.time != null)
                Text('${homeCtrl.time?.hour}:${homeCtrl.time?.minute}'),

                ElevatedButtonCommon(
                    title: "Media Player",
                    onPressed: () => Get.toNamed(routeName.audioScreen)),

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

                /*StreamBuilder<RecordingDisposition>(
                    stream: homeCtrl.recorder.onProgress,
                    builder: (context, snapshot) {
                      final duration = snapshot.hasData
                          ? snapshot.data!.duration
                          : Duration.zero;

                      String towDigits (int n)=> n.toString().padLeft(2,'0');
                      final minutes = towDigits(duration.inMinutes.remainder(60));
                      final seconds = towDigits(duration.inSeconds.remainder(60));

                      return Text("$duration : $seconds");
                    }),*/

                /* Text(homeCtrl.recorder.isRecording ? "Recording In Progress" : "Recorder  Is Stopped"),

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
                        : const Icon(Icons.mic_rounded)),*/

                Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  height: 80,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFFAF0E6),
                    border: Border.all(
                      color: Colors.indigo,
                      width: 3,
                    ),
                  ),
                  child: Row(children: [
                    ElevatedButton(
                      onPressed: homeCtrl.getRecorderFn(),
                      //color: Colors.white,
                      //disabledColor: Colors.grey,
                      child: Text(
                          homeCtrl.mRecorder!.isRecording ? 'Stop' : 'Record'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(homeCtrl.mRecorder!.isRecording
                        ? 'Recording in progress'
                        : 'Recorder is stopped'),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  height: 80,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFFAF0E6),
                    border: Border.all(
                      color: Colors.indigo,
                      width: 3,
                    ),
                  ),
                  child: Row(children: [
                    ElevatedButton(
                      onPressed: homeCtrl.getPlaybackFn(),
                      //color: Colors.white,
                      //disabledColor: Colors.grey,
                      child:
                          Text(homeCtrl.mPlayer!.isPlaying ? 'Stop' : 'Play'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(homeCtrl.mPlayer!.isPlaying
                        ? 'Playback in progress'
                        : 'Player is stopped'),
                  ]),
                ),

                /*homeCtrl.video != null
                    ? Container(
                        child: homeCtrl.videoPlayerController!.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: homeCtrl
                                    .videoPlayerController!.value.aspectRatio,
                                child: VideoPlayer(
                                    homeCtrl.videoPlayerController!))
                            : Container())*/
                /*: homeCtrl.camera != null
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
                                : Container())*/
                /*  : Container(),*/
              ]))));
    });
  }
}
