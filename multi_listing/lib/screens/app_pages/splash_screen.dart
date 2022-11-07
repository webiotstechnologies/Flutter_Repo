import '../../config.dart';

class SplashScreen extends StatelessWidget {
  final splashCtrl = Get.put(SplashController());

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (splashCtrl) {
      return Scaffold(
        // Icon
          body: Center(child: Image.asset(eImageAssets.shoppingBag, scale: 7)));
    });
  }
}
