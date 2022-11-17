import '../../config.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/elevated_button_common.dart';

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
              title: Text(
                appFonts.codeScanner,
                style: AppCss.montserratSemiBold18,
              )),
          body: Center(
              child: SingleChildScrollView(
                  child: Column(children: [
                    // Scan QR Code/Barcode
            ElevatedButtonCommon(
                title: appFonts.scanQr,
                onPressed: () => homeCtrl.scanBarcodeNormal()),
            if (homeCtrl.scanBarcode != null)
              // Scanned QR Code / Barcode Result
              Text('Scan Result : ${homeCtrl.scanBarcode}',
                  style: AppCss.montserratSemiBold16),
            // Enter Name Field
            TextFieldCommon(
                title: appFonts.enterName, controller: homeCtrl.nameController),
            // Enter Email Field
                    TextFieldCommon(
                title: appFonts.enterEmail,
                controller: homeCtrl.emailController),
            // Enter Number Field
            TextFieldCommon(
                title: appFonts.enterNumber,
                controller: homeCtrl.numberController),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              // Generate QR Code
              ElevatedButtonCommon(
                  title: appFonts.generateQr,
                  onPressed: () => homeCtrl.onQrGenerate()),
              // Generate Barcode
              ElevatedButtonCommon(
                  title: appFonts.generateBar,
                  onPressed: () => homeCtrl.onBarcodeGenerate())
            ])
          ]).paddingSymmetric(vertical: Insets.i20, horizontal: Insets.i20))));
    });
  }
}
