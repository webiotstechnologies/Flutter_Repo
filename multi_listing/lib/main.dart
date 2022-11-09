import 'package:multi_listing/config.dart';

void main() async{
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
      getPages: AppRoute().getPages,
    );
  }
}
