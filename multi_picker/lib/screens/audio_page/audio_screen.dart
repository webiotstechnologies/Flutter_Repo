import 'dart:io';
import '../../config.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: appCtrl.appTheme.indigo,
              centerTitle: true,
              title: Text(appFonts.audioPlayer)),
          body: Center(
              child: Column(children: [
            Image.asset(eImageAssets.cd, scale: 3)
                .paddingOnly(bottom: Insets.i10),
            // play audio Button
            ElevatedButtonCommon(
                title: appFonts.playSong,
                onPressed: () => homeCtrl.playAudioFromLocalStorage()),
            if (homeCtrl.file != null)
              Column(children: [
                // Song Name
                Text(homeCtrl.file!.path.split(Platform.pathSeparator).last,
                        style: AppCss.montserratSemiBold18)
                    .paddingSymmetric(vertical: Insets.i15),
                // Audio Slider
                Slider(
                    activeColor: appCtrl.appTheme.indigo,
                    value: homeCtrl.songDurationInSeconds,
                    max: homeCtrl.currentPositionInSeconds,
                    min: 0,
                    onChanged: (val) => homeCtrl.onSliderChange(val)),
                // Song Duration
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(homeCtrl.currentPosition,
                          style: AppCss.montserratSemiBold16),
                      Text(homeCtrl.songDuration,
                          style: AppCss.montserratSemiBold16)
                    ]).paddingSymmetric(horizontal: Insets.i20),
                // Play & Pause Button
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                              homeCtrl.audioPlayer!.playing
                                  ? eImageAssets.pause
                                  : eImageAssets.play,
                              scale: 10)
                          .paddingOnly(top: Insets.i20)
                          .inkWell(onTap: () => homeCtrl.onPlayPause()),
                      Image.asset(eImageAssets.stop, scale: 10)
                          .inkWell(onTap: () => homeCtrl.stopAudio())
                    ])
              ])
          ])));
    });
  }
}
