import '../config.dart';

class LanguageButton extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  LanguageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      // Language Change Button
      return IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DirectionalRtl(
                      child: AlertDialog(
                          title: Text(appFonts.selectLang.tr),
                          content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: homeCtrl.languageLists
                                  .asMap()
                                  .entries
                                  .map((e) => Row(
                                    children: [
                                      Image.asset(e.value['image'],scale: 13),
                                      Text(
                                          e.value["language"].toString().tr,
                                          style:
                                          AppCss.montserratSemiBold16)
                                          .inkWell(onTap: () async {
                                        if (e.value["code"] == "en") {
                                          appCtrl.languageVal = "en";
                                        } else if (e.value["code"] == "hi") {
                                          appCtrl.languageVal = "hi";
                                        } else if (e.value["code"] == "ar") {
                                          appCtrl.languageVal = "ar";
                                        } else if (e.value["code"] == "gu") {
                                          appCtrl.languageVal = "gu";
                                        } else if (e.value["code"] == "es") {
                                          appCtrl.languageVal = "es";
                                        } else if (e.value["code"] == "de") {
                                          appCtrl.languageVal = "de";
                                        } else if (e.value["code"] == "fr") {
                                          appCtrl.languageVal = "fr";
                                        } else if (e.value["code"] == "ja") {
                                          appCtrl.languageVal = "ja";
                                        } else if (e.value["code"] == "ko") {
                                          appCtrl.languageVal = "ko";
                                        } else if (e.value["code"] == "ru") {
                                          appCtrl.languageVal = "ru";
                                        }
                                        appCtrl.update();
                                        Get.updateLocale(e.value["locale"]);
                                        await homeCtrl.storage
                                            .write("locale", e.value["code"]);
                                        Get.forceAppUpdate();
                                        Get.back();
                                      }).paddingOnly(bottom: Insets.i15)
                                    ],
                                  ))
                                  .toList())));
                });
          },
          icon: const Icon(Icons.language));
    });
  }
}
