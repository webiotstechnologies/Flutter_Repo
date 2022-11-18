import 'dart:convert';
import 'package:flutter/services.dart';
import '../config.dart';

class HomeController extends GetxController {
  String scanBarcode = "No data found !";

  TextEditingController barCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  dynamic encodedJson;

  // Qr Code Generate Data Method
  generateQrCode() {
    Map<String, dynamic> myData = {
      'name': nameController.text,
      'email': emailController.text,
      'number': numberController.text
    };
    encodedJson = jsonEncode(myData);
    update();
  }

  // Scan Qr / Barcode Method
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', appFonts.cancel, true, ScanMode.DEFAULT);
    } on PlatformException {
      barcodeScanRes = appFonts.failedTo;
    }
    scanBarcode = barcodeScanRes;
    update();
  }

  //  After Scan Result Dialog Box
  showDialogBox() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(appFonts.scanResult),
              content: Text(
                  scanBarcode == "-1" ? appFonts.dataNotFound : scanBarcode),
              actions: [
                TextButton(
                    onPressed: () => Get.back(),
                    child: Text(appFonts.ok,
                        style: AppCss.montserratSemiBold16
                            .textColor(appCtrl.appTheme.indigo)))
              ]);
        });
  }
}
