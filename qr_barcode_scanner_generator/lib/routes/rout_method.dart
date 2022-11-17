import 'package:qr_barcode_scanner_generator/routes/rout_name.dart';
import '../config.dart';
import '../screens/app_pages/home_screen.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.homeScreen, page: () =>  HomeScreen()),
    GetPage(name: _routeName.qrScreen, page: () =>  QrCodeScreen()),
    GetPage(name: _routeName.barcodeScreen, page: () =>  BarcodeScreen()),

  ];
}
