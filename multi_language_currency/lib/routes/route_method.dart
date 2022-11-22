import 'package:multi_language_currency/screens/app_pages/product_detail_screen.dart';

import '../config.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.splashScreen, page: () =>  SplashScreen()),
    GetPage(name: _routeName.homeScreen, page: () =>  HomeScreen()),
    GetPage(name: _routeName.productScreen, page: () =>  ProductDetailScreen()),

  ];
}
