import 'package:multi_listing/common/extension/spacing.dart';
import '../../config.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/text_field.dart';

class HomeScreen extends StatelessWidget {
  final homeCtrl = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
          backgroundColor: appCtrl.appTheme.textFieldColor,
          appBar: AppBar(
              actions: [
                Icon(homeCtrl.isShow ? Icons.list : Icons.grid_view,
                        size: Sizes.s30)
                    .inkWell(onTap: () => homeCtrl.onChanges())
                    .paddingOnly(right: Insets.i15)
              ],
              elevation: 0,
              backgroundColor: appCtrl.appTheme.indigo,
              centerTitle: true,
              title: Text(appFonts.multiListing,style: AppCss.montserratSemiBold20,)),
          body: Column(children: [
            Row(children: [
              Expanded(
                  child: TextFields(
                      hintText: appFonts.searchHere,
                      fillColor: appCtrl.appTheme.whiteColor,
                      prefixIcon:
                          Icon(Icons.search, color: appCtrl.appTheme.indigo))),
              const HSpace(Sizes.s10),
              Icon(
                Icons.filter_list,
                color: appCtrl.appTheme.whiteColor,
              ).paddingAll(Insets.i12).decorated(
                  color: appCtrl.appTheme.indigo,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppRadius.r30)))
            ]),
            const VSpace(Sizes.s20),
            homeCtrl.isShow ? const GridViewScreen() : const ListViewScreen()
          ]).paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i10));
    });
  }
}
