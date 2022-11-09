import 'package:multi_picker/config.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.homeScreen, page: () =>   HomeScreen()),

  ];
}
