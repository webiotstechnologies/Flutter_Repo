import 'package:get/get.dart';

class HomeController extends GetxController {
    bool isShow = false;

    onChanges() {
      isShow = !isShow;
      update();
    }
}