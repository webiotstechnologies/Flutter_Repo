import 'package:flutter/cupertino.dart';
import '../config.dart';

class MediaButtons extends StatelessWidget {
  const MediaButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // photo Icon
        ButtonCommon(
            icon: Icons.photo_library,
            onTap: () => appCtrl.onBottomSheetOpen(true)),
        // Audio Icon
        ButtonCommon(
            icon: Icons.audiotrack,
            onTap: () => Get.toNamed(routeName.audioScreen))
      ]).paddingOnly(bottom: Insets.i30),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // Video Icon
        ButtonCommon(
            icon: Icons.video_collection_rounded,
            onTap: () => appCtrl.onBottomSheetOpen(false)),
        // Recording Icon
        ButtonCommon(
            icon: CupertinoIcons.mic_fill,
            onTap: () => Get.toNamed(routeName.recordingScreen))
      ]).paddingOnly(bottom: Insets.i30)
    ]);
  }
}
