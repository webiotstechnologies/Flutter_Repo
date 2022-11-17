

import '../../config.dart';
import '../../controllers/barcode_controller.dart';

class BarcodeScreen extends StatelessWidget {
  final barcodeCtrl = Get.put(BarcodeController());

  BarcodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BarcodeController>(builder: (barcodeCtrl) {
      return Scaffold(
          backgroundColor: appCtrl.appTheme.indigoShade,
          appBar: AppBar(
              backgroundColor: appCtrl.appTheme.indigo,
              centerTitle: true,
              title: Text(appFonts.barcode,style: AppCss.montserratExtraBold18)),
          body: Center(
              child: barcodeCtrl.barData != null
              // Generated Barcode
                  ? Card(
                      color: appCtrl.appTheme.whiteColor,
                      child: BarcodeWidget(
                              width: Sizes.s300,
                              height: Sizes.s80,
                              barcode: Barcode.code128(),
                              data: barcodeCtrl.barData,
                              drawText: false)
                          .paddingAll(Insets.i10))
                  : const Text("No Data Found")));
    });
  }
}
