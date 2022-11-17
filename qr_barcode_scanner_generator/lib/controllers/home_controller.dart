import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../config.dart';
import '../routes/index.dart';



class HomeController extends GetxController {
  String? scanBarcode;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  dynamic encodedJson;



  generateQrCode() {
    Map<String, dynamic> myData = {
      'name': nameController.text,
      'number': numberController.text,
      'email': emailController.text,
    };
    encodedJson = jsonEncode(myData);
    update();
  }



  Future<void> scanBarcodeNormal() async {
      scanBarcode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
    update();
  }

  onQrGenerate() {
    generateQrCode();
    update();
    var data = {"json": encodedJson};
    Get.toNamed(routeName.qrScreen, arguments: data);
  }

  onBarcodeGenerate() {
    generateQrCode();
    update();
    var data = {"json": encodedJson};
    Get.toNamed(routeName.barcodeScreen, arguments: data);
  }

}
