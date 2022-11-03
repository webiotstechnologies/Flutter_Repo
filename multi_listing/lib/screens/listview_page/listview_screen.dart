import '../../config.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: homeCtrl.items.isEmpty &&
                  homeCtrl.searchController.text.isNotEmpty
              ? Column(children: [Text("Item Not Found")])
              : Column(
                  children: homeCtrl.searchController.text.isNotEmpty
                      ? homeCtrl.items
                          .asMap()
                          .entries
                          .map((e) => ProductLists(data: e.value))
                          .toList()
                      : homeCtrl.productList
                          .asMap()
                          .entries
                          .map((e) => ProductLists(data: e.value))
                          .toList()));
    });
  }
}
