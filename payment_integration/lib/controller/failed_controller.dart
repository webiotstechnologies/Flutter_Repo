import '../config.dart';

class FailedController extends GetxController {
  String? payment;
  TextEditingController amountController = TextEditingController();

  @override
  void onReady() {
    dynamic data = Get.arguments;
    payment = data["payment"];
    amountController = data["controller"];
    update();
    // TODO: implement onReady
    super.onReady();
  }
}