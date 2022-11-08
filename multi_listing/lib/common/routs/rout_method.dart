import '../../config.dart';


RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.splashScreen, page: () =>   SplashScreen()),
    GetPage(name: _routeName.homeScreen, page: () =>   HomeScreen()),
    GetPage(name: _routeName.productDetailScreen, page: () =>   ProductDetailScreen())
  ];
}
