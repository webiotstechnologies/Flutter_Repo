import '../../config.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({Key? key}) : super(key: key);

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  final homeCtrl = Get.find<HomeController>();
  @override
  void initState() {
    // TODO: implement initState
  //  homeCtrl.mPlayer = FlutterSoundPlayer();
    if(homeCtrl.mPlayer!=null) {
      homeCtrl.mPlayer!.openPlayer().then((value) {
        homeCtrl.mPlayerIsInited = true;
        homeCtrl.update();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return WillPopScope(
        onWillPop: ()async{
          homeCtrl.stopPlayer();
          homeCtrl.stopRecorder();
          homeCtrl.stopAudio();
          return true;
        },
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: appCtrl.appTheme.indigo,
                centerTitle: true,
                title: Text(appFonts.recordingScreen)),
            body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Recording Button
              RecordingButton(
                      title: homeCtrl.mRecorder != null ? homeCtrl.mRecorder!.isRecording
                          ? appFonts.recordingInProgress
                          : appFonts.recorderIsStopped : "Play",
                      eTitle:homeCtrl.mRecorder!.isRecording
                          ? appFonts.stop
                          : appFonts.record,
                      onPressed: homeCtrl.getRecorderFn())
                  .paddingOnly(bottom: Insets.i30),
              // Recorded Audio Playing Button
              RecordingButton(
                  title: homeCtrl.mPlayer != null ? homeCtrl.mPlayer!.isPlaying
                      ? appFonts.playbackInProgress
                      : appFonts.playerIsStopped : "No Audio Found",
                  eTitle:
                  homeCtrl.mPlayer!.isPlaying ? appFonts.stop : appFonts.play,
                  onPressed: homeCtrl.getPlaybackFn())
            ])),
      );
    });
  }
}
