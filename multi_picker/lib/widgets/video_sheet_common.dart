import '../config.dart';


class VideoBottomSheet extends StatelessWidget {
  const VideoBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return BottomSheetCommon(
          title: appFonts.chooseVideo,
          firstImage: eImageAssets.gallery,
          firstName: appFonts.gallery,
          fistOnTap: () => homeCtrl.pickVideo(ImageSource.gallery),
          secondImage: eImageAssets.camera,
          secondName: appFonts.camera,
          secondOnTap: () => homeCtrl.pickVideo(ImageSource.camera));
    });
  }
}
