import '../config.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.homeScreen, page: () =>  HomeScreen()),
    GetPage(name: _routeName.paymentMethodScreen, page: () =>  PaymentMethodScreen()),
    GetPage(name: _routeName.paymentFailed, page: () =>  PaymentFailed()),
    GetPage(name: _routeName.paymentSuccess, page: () =>  PaymentSuccess()),
  ];
}
