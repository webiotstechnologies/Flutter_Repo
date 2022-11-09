import 'dart:async';
import 'package:multi_listing/config.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
       Timer(const Duration(seconds: 2), ()=> Get.toNamed(routeName.homeScreen));
       // Save List In Storage
         List<dynamic> list = appCtrl.storage.read("productList")?? [];
          if(list.isEmpty) {
             appCtrl.storage.write("productList", appArray.listImages);
          }
          update();
     // TODO: implement onReady
    super.onReady();
  }
}