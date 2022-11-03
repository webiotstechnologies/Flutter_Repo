import '../../config.dart';
RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.homeScreen, page: () =>   HomeScreen()),
    GetPage(name: _routeName.listViewScreen, page: () =>   ListViewScreen()),
    GetPage(name: _routeName.gridViewScreen, page: () =>  const GridViewScreen()),

  ];
}
