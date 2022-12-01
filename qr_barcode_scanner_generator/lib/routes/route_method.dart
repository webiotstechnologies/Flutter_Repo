import '../config.dart';


RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.homeScreen, page: () =>  HomeScreen()),
    GetPage(name: _routeName.barcodeGenerateScreen, page: () =>  BarcodeGenerateScreen()),
    GetPage(name: _routeName.qrGenerateScreen, page: () =>  QrCodeGenerateScreen())

  ];
}
