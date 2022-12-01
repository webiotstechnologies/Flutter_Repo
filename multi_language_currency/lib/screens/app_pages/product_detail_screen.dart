import '../../config.dart';
import 'dart:math' as math;

class ProductDetailScreen extends StatelessWidget {
  final productCtrl = Get.put(ProductController());

  ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productCtrl) {
      return DirectionalRtl(
        child: Scaffold(
            backgroundColor: appCtrl.appTheme.whiteColor,
            appBar: AppBar(
                backgroundColor: appCtrl.appTheme.whiteColor,
                centerTitle: true,
                elevation: 0,
                leading: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back,
                        color: appCtrl.appTheme.blackColor)),
                actions: [NotificationCommon(number: productCtrl.counter)],
                // Product Detail Text
                title: Text(appFonts.productDetail.tr,
                    style: AppCss.montserratExtraBold18
                        .textColor(appCtrl.appTheme.blackColor))),
            body: productCtrl.data != null
                ? Stack(children: [
                    SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          ClipRRect(
                                  // Image
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(AppRadius.r20)),
                                  child: appCtrl.isRTL ||
                                          appCtrl.languageVal == "ar"
                                      ? Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.rotationY(math.pi),
                                          child: Image.asset(
                                              productCtrl.data["image"],
                                              height: Sizes.s270,
                                              fit: BoxFit.cover,
                                              width: double.infinity))
                                      : Image.asset(productCtrl.data["image"],
                                          height: Sizes.s270,
                                          fit: BoxFit.cover,
                                          width: double.infinity))
                              .paddingOnly(bottom: Insets.i20),
                           // Product Details
                          ProductDetailCommon(data: productCtrl.data)
                        ]).paddingSymmetric(horizontal: Insets.i20)),
                    // Bottom Buttons Layout
                    BottomLayout()
                  ])
                : Container()),
      );
    });
  }
}
