import 'package:qr_barcode_scanner_generator/routes/index.dart';
import 'package:qr_barcode_scanner_generator/screens/app_pages/home_screen.dart';

import 'config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
         debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      getPages: appRoute.getPages,
    );
  }
}

