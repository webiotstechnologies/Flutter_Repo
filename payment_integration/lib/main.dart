import 'package:flutter_stripe/flutter_stripe.dart';
import 'config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51M6vfUSAD9ydEJ0JaJFMEjyTrwk8JSNU4xMH9s2pCEUWRxlQ5xO3EzvntrqSp1WGT0DzwmAnAsj0rfFlmlFIlncQ00A3ewAkjj";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
           debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      getPages: appRoute.getPages
    );
  }
}

