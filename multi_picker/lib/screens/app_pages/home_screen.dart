import 'package:multi_picker/config.dart';

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
                          children: const [
                            // Video & Audio Button
                            MediaButtons(),
                            // Date & Time Button
                            TimeButtons()])
                      .paddingSymmetric(
                          vertical: Insets.i20, horizontal: Insets.i20))));
    });
  }
}
