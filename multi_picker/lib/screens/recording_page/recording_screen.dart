import '../../config.dart';

class RecordingScreen extends StatelessWidget {
  const RecordingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return WillPopScope(
        onWillPop: ()async{
          homeCtrl.mPlayer!.closePlayer();
          homeCtrl.mPlayer = null;
          homeCtrl.file = null;
          homeCtrl.mRecorder!.closeRecorder();
          homeCtrl.audioPlayer?.dispose();
          homeCtrl.audioPlayer?.stop();
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
                      title: homeCtrl.mRecorder!.isRecording
                          ? appFonts.recordingInProgress
                          : appFonts.recorderIsStopped,
                      eTitle: homeCtrl.mRecorder!.isRecording
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
                  homeCtrl.mPlayer != null ?  homeCtrl.mPlayer!.isPlaying ? appFonts.stop : appFonts.play : "Play",
                  onPressed: homeCtrl.getPlaybackFn())
            ])),
      );
    });
  }
}
