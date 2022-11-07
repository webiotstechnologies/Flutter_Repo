import 'package:flutter/cupertino.dart';
import '../../config.dart';

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
                // Icon Button
                Icon(homeCtrl.isShow ? Icons.list : Icons.grid_view,
                        size: Sizes.s30)
                    .inkWell(onTap: () => homeCtrl.onChanges())
                    .paddingOnly(right: Insets.i15)
              ],
              elevation: 0,
              backgroundColor: appCtrl.appTheme.indigo,
              centerTitle: true,
              title: Text(appFonts.multiListing,
                  style: AppCss.montserratSemiBold20)),
          body: SingleChildScrollView(
            child: Column(children: [
              // Text Field
              TextFields(
                  onChanged: (value) {
                    if(value.length > 0){
                      homeCtrl.onFinal(
                          value, homeCtrl.gender, homeCtrl.size, homeCtrl.color,true,"");
                    }else{
                      homeCtrl.items = homeCtrl.productList;
                      homeCtrl.update();
                    }
                  },
                  controller: homeCtrl.searchController,
                  hintText: appFonts.searchHere,
                  fillColor: appCtrl.appTheme.whiteColor,
                  prefixIcon:
                      Icon(Icons.search, color: appCtrl.appTheme.indigo)),
              const VSpace(Sizes.s10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                // Filter Button
                SortingButton(title: appFonts.filter, icon: Icons.filter_list)
                    .inkWell(onTap: () => appCtrl.filterBottomSheet()),
                // Sorting Button
                SortingButton(
                        title: appFonts.sort,
                        icon: CupertinoIcons.arrow_up_arrow_down)
                    .inkWell(onTap: () => appCtrl.sortingBottomSheet())
              ]),
              const VSpace(Sizes.s10),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.69,
                  child: homeCtrl.isShow
                      // Gridview Screen
                      ? const GridViewScreen()
                      // List View Screen
                      : const ListViewScreen())
            ]).paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i10),
          ));
    });
  }
}
