import 'package:authentication_repo/config.dart';

class FacebookController extends GetxController {


  bool isLoading = false;

  onLoadingFalse() {
    isLoading = false;
    update();
  }

  onLoadingTrue() {
    isLoading = true;
    update();
  }


}
