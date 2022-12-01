import '../config.dart';

class HomeController extends GetxController {
  String? selectLanguage;
  List items = [];
  List languageLists = [];
  List currencyLists = [];
  dynamic currency;
  GetStorage storage = GetStorage();

  // RTL Changes
  onRtl () {
    appCtrl.isRTL = !appCtrl.isRTL;
    appCtrl.storage.write("isRtl", appCtrl.isRTL);
    appCtrl.update();
    Get.forceAppUpdate();
  }

  @override
  void onReady() {
    // Set Array In New List
    items = appArray.listImages;
    languageLists = appArray.languageList;
    currencyLists = appArray.currencyList;
    // TODO: implement onReady
    update();
    super.onReady();
  }
}