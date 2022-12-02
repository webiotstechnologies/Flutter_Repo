import '../config.dart';

class AmountBox extends StatelessWidget {
  final String? amount;
  const AmountBox({Key? key,this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Amount Box
    return  SizedBox(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Amount
              Text(amount!, style: AppCss.montserratExtraBold50)
                  .paddingOnly(bottom: Insets.i25),
              Row(children: [
                // incorporation text
                RowCommon(title: appFonts.incorporation)
                    .paddingOnly(right: Insets.i65),
                // banking text
                RowCommon(title: appFonts.banking)
              ]),
              const VSpace(Sizes.s20),
              Row(children: [
                // communication text
                RowCommon(title: appFonts.communication)
                    .paddingOnly(right: Insets.i45),
                // offer text
                RowCommon(title: appFonts.offers)
              ]).paddingOnly(bottom: Insets.i20),
              // know more text
              Text(appFonts.knowMore,
                  style: AppCss.montserratSemiBold14
                      .textColor(appCtrl.appTheme.blue))
            ]).paddingSymmetric(
            horizontal: Insets.i20, vertical: Insets.i20))
        .decorated(
        borderRadius: const BorderRadius.all(
            Radius.circular(AppRadius.r10)),
        border:
        Border.all(color: appCtrl.appTheme.indigoShade))
        .paddingOnly(bottom: Insets.i25);
  }
}
