import '../../config.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: homeCtrl.items.isNotEmpty
              // All Items In ListView
              ? Column(children: [
                  ...homeCtrl.items
                      .asMap()
                      .entries
                      .map((e) => ProductLists(data: e.value))
                      .toList()
                ])
              // Item Not Found Text
              : const NoItemFound());
    });
  }
}
