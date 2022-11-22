import '../../config.dart';


class SplashScreen extends StatelessWidget {
  final splashCtrl = Get.put(SplashController());

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (splashCtrl) {
      // Splash Image
      return Scaffold(
          backgroundColor: appCtrl.appTheme.blue200,
          body: Center(child: Image.asset(eImageAssets.splash, scale: 10)));
    });
  }
}
