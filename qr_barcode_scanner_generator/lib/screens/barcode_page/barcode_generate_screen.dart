import '../../config.dart';

class BarcodeGenerateScreen extends StatelessWidget {
  final barGenerateCtrl = Get.find<HomeController>();

  BarcodeGenerateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (barGenerateCtrl) {
      return WillPopScope(
          onWillPop: () async {
            barGenerateCtrl.barCodeController.clear();
            return true;
          },
          child: Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: appCtrl.appTheme.indigo,
                  title: Text(appFonts.generateBar,
                      style: AppCss.montserratExtraBold18)),
              body: SingleChildScrollView(
                  child: Column(children: [
                // Enter Number Field
                TextFieldCommon(
                    title: appFonts.enterValue,
                    controller: barGenerateCtrl.barCodeController),
                // Generate Barcode
                ElevatedButtonCommon(
                    title: appFonts.generateBar,
                    onTap: () {
                      barGenerateCtrl.update();
                    }).paddingOnly(bottom: Insets.i100),
                // Generated Barcode
                Card(
                    color: appCtrl.appTheme.whiteColor,
                    child: barGenerateCtrl.barCodeController.text.isEmpty
                        ? const Text('')
                        : BarcodeWidget(
                                width: Sizes.s300,
                                height: Sizes.s80,
                                barcode: Barcode.code128(),
                                data: barGenerateCtrl.barCodeController.text,
                                drawText: false)
                            .paddingAll(Insets.i10))
              ]).paddingOnly(
                      top: Insets.i70, right: Insets.i20, left: Insets.i20))));
    });
  }
}
