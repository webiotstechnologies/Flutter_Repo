import '../config.dart';

class BottomLayout extends StatelessWidget {
  final productCtrl = Get.find<ProductController>();

  BottomLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productCtrl) {
      return Align(
          alignment: Alignment.bottomCenter,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            productCtrl.counter == 0
                ? ButtonCommon(width: Sizes.s150, title: appFonts.addToCart.tr)
                    .inkWell(onTap: () => productCtrl.onIncrease())
                : Row(children: [
                    // Remove Button
                    PlusMinusCommon(
                        icon: Icons.remove_circle,
                        onPressed: () => productCtrl.onDecrease()),
                    Text("${productCtrl.counter}",
                        style: AppCss.montserratExtraBold16),
                    // Add Button
                    PlusMinusCommon(
                        icon: Icons.add_circle_rounded,
                        onPressed: () => productCtrl.onIncrease())
                  ]),
            // Buy Button
            ButtonCommon(width: Sizes.s100, title: appFonts.buy.tr)
          ]).paddingSymmetric(vertical: Insets.i20, horizontal: Insets.i20));
    });
  }
}
