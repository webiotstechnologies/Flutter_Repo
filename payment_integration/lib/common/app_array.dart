
import '../config.dart';

class AppArray {
  var paymentMethod = [
    {
      "image": eImageAssets.razorPay,
      "value": "razor",
      "name": appFonts.razorPay,
      "subtext": appFonts.razorSub,
    },
    {
      "image": eImageAssets.stripe,
      "value": "stripe",
      "name": appFonts.stripePay,
      "subtext": appFonts.stripeSub,
    },
    {
      "image": eImageAssets.payPal,
      "value": "paypal",
      "name": appFonts.paypal,
      "subtext": appFonts.paypalSub,
    }
  ];
}