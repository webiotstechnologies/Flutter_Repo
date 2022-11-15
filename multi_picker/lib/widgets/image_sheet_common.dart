import '../config.dart';

class ImageBottomSheet extends StatelessWidget {
  const ImageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      // Image Select BottomSheet
      return BottomSheetCommon(
          title: appFonts.chooseImage,
          firstImage: eImageAssets.gallery,
          firstName: appFonts.gallery,
          fistOnTap: () => homeCtrl.pickImage(ImageSource.gallery),
          secondImage: eImageAssets.camera,
          secondName: appFonts.camera,
          secondOnTap: () => homeCtrl.pickImage(ImageSource.camera));
    });
  }
}
