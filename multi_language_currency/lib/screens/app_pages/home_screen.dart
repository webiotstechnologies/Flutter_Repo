import 'dart:math' as math;
import '../../config.dart';

class HomeScreen extends StatelessWidget {
  final homeCtrl = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return DirectionalRtl(
          child: Scaffold(
              backgroundColor: appCtrl.appTheme.textFieldColor,
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: appCtrl.appTheme.indigo,
                  title: Text(appFonts.multiFeature.tr,
                      style: AppCss.montserratExtraBold18),
                  actions: [
                    SizedBox(
                            child: appCtrl.isRTL || appCtrl.languageVal == "ar"
                                ? Image.asset(eImageAssets.rtl,
                                    scale: 2,
                                    color: appCtrl.appTheme.whiteColor)
                                : Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: Image.asset(eImageAssets.rtl,
                                        scale: 2,
                                        color: appCtrl.appTheme.whiteColor)))
                        .inkWell(onTap: () => homeCtrl.onRtl()),
                    // Currency Button
                    CurrencyButton(),
                    // Language Button
                    LanguageButton(),
                  ]),
              body: SingleChildScrollView(
                // All Product List
                  child: Column(children: [
                ...homeCtrl.items
                    .asMap()
                    .entries
                    .map((e) => ProductLists(data: e.value))
                    .toList()
              ]).paddingSymmetric(
                      horizontal: Insets.i20, vertical: Insets.i20))));
    });
  }
}