import '../Screens/otp_screen/otp_screen.dart';
import '../config.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.loginScreen, page: () =>  SignUpScreen()),
    GetPage(name: _routeName.otpScreen, page: () =>  OtpScreen()),

  ];
}
