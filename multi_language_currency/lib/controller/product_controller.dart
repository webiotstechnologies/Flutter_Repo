import 'package:get/get.dart';

class ProductController extends GetxController {
  int counter = 0;
 dynamic data;
 // Increase Button
  onIncrease () {
    if(counter < 10) {
      counter++;
    }
     update();
  }

  // Decrease Button
  onDecrease () {
    if(counter > 0) {
      counter--;
    }
    update();
  }


  @override
  void onReady() {
    // Pick Data From Arguments
    data = Get.arguments;
    update();
    // TODO: implement onReady
    super.onReady();
  }

}