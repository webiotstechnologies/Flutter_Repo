import '../config.dart';

class BottomLayout extends StatelessWidget {
  const BottomLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (productCtrl) {
        return Align(
          alignment: Alignment.bottomCenter,
          child:   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                productCtrl.counter == 0
                    ? ButtonCommon(title: appFonts.addToCart)
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
                ButtonCommon(title: appFonts.buy)
              ]).paddingSymmetric(vertical: Insets.i20,horizontal: Insets.i20),
        );
      }
    );
  }
}
