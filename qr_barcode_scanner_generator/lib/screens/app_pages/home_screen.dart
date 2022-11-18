import '../../config.dart';

class HomeScreen extends StatelessWidget {
  final homeCtrl = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: appCtrl.appTheme.indigo,
              title: Text(appFonts.codeScanner,
                  style: AppCss.montserratSemiBold18)),
          body: Center(
              child: SingleChildScrollView(
                  child: Column(children: [
            // Scan QR Code/Barcode
            ElevatedButtonCommon(
                title: appFonts.scanQr,
                onTap: () =>
                    homeCtrl.scanBarcodeNormal().then((value) => homeCtrl.showDialogBox())),
            // Generate Barcode
            ElevatedButtonCommon(
                title: appFonts.generateQr,
                onTap: () => Get.toNamed(routeName.qrGenerateScreen)),
            // Generate Barcode
            ElevatedButtonCommon(
                title: appFonts.generateBar,
                onTap: () => Get.toNamed(routeName.barcodeGenerateScreen))
          ]).paddingSymmetric(vertical: Insets.i20, horizontal: Insets.i20))));
    });
  }
}
