import '../config.dart';

class HomeController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  // Buy Button
  onBuy() {
    if (globalKey.currentState!.validate()) {
      var data = {
        "controller": amountController,
        "eController": emailController,
        "nController": nameController,
      };
      Get.toNamed(routeName.paymentMethodScreen, arguments: data);
    }
  }
}
