import '../../config.dart';
import '../../widgets/gridview_product_list.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return SingleChildScrollView(
          child: homeCtrl.items.isEmpty &&
                  homeCtrl.searchController.text.isNotEmpty
              ? Center(
                child: Column(
                  children: [
                    Text("Item No Found")
                  ],
                ),
              )
              : Column(children: [
                  GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeCtrl.searchController.text.isNotEmpty
                          ? homeCtrl.items.length
                          : homeCtrl.productList.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisExtent: 300,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 1,
                              maxCrossAxisExtent: 200),
                      itemBuilder: (BuildContext context, i) {
                        return GridviewList(
                            data: homeCtrl.searchController.text.isNotEmpty
                                ? homeCtrl.items[i]
                                : homeCtrl.productList[i]);
                      }),
                ]));
    });
  }
}
