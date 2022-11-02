import '../../config.dart';

class SplashScreen extends StatelessWidget {
  final splashCtrl = Get.put(SplashController());
   SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) {
        return Scaffold(
            backgroundColor: appCtrl.appTheme.lightIndigo,
            // Splash Logo
            body: Center(child: Image.asset(eImageAssets.splash,scale: 7)));
      }
    );
  }
}
