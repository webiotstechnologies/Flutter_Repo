import '../../config.dart';

class QrCodeGenerateScreen extends StatelessWidget {
  final qrGenerateCtrl = Get.find<HomeController>();

  QrCodeGenerateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (qrGenerateCtrl) {
      return WillPopScope(
          onWillPop: () async {
            qrGenerateCtrl.emailController.clear();
            qrGenerateCtrl.numberController.clear();
            qrGenerateCtrl.nameController.clear();
            return true;
          },
          child: Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: appCtrl.appTheme.indigo,
                  title: Text(appFonts.generateQr,
                      style: AppCss.montserratExtraBold18)),
              body: SingleChildScrollView(
                child: Column(children: [
                  // Enter Name Field
                  TextFieldCommon(
                      title: appFonts.enterName,
                      controller: qrGenerateCtrl.nameController),
                  // Enter Email Field
                  TextFieldCommon(
                      title: appFonts.enterEmail,
                      controller: qrGenerateCtrl.emailController),
                  // Enter Number Field
                  TextFieldCommon(
                      title: appFonts.enterNumber,
                      controller: qrGenerateCtrl.numberController),
                  // Generate Qr Button
                  ElevatedButtonCommon(
                      title: appFonts.generateQr,
                      onTap: () {
                        qrGenerateCtrl.generateQrCode();
                        qrGenerateCtrl.update();
                      }).paddingOnly(bottom: Insets.i60),
                   qrGenerateCtrl.encodedJson != null
                          // Generated QR Code
                          ? Card(
                              color: appCtrl.appTheme.whiteColor,
                              child: BarcodeWidget(
                                height: Sizes.s200,
                                      width: Sizes.s200,
                                      data: qrGenerateCtrl.encodedJson!,
                                      barcode: Barcode.qrCode())
                                  .paddingAll(Insets.i10))
                          : Container()
                ]).paddingAll(Insets.i20),
              )));
    });
  }
}
