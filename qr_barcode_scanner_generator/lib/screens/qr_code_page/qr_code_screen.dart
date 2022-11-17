import '../../config.dart';
import '../../controllers/qr_controller.dart';

class QrCodeScreen extends StatelessWidget {
  final qrCtrl = Get.put(QrController());

  QrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrController>(builder: (qrCtrl) {
      return Scaffold(
          backgroundColor: appCtrl.appTheme.indigoShade,
          appBar: AppBar(
              backgroundColor: appCtrl.appTheme.indigo,
              centerTitle: true,
              title: Text(appFonts.qrCode,style: AppCss.montserratExtraBold18)),
          body: Center(
              child: qrCtrl.qrData != null
              // Generated QR Code
                  ? Card(
                      color: appCtrl.appTheme.whiteColor,
                      child: QrImage(
                              data: qrCtrl.qrData!,
                              version: QrVersions.auto,
                              size: Sizes.s200)
                          .paddingAll(Insets.i10))
                  : const Text("No Data Found")));
    });
  }
}
