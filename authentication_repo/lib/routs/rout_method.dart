import 'package:authentication_repo/Screens/number_page/number_screen.dart';
import '../Screens/app_pages/home_page.dart';
import '../Screens/facebook_login_page/facebook_login_screen.dart';
import '../Screens/otp_screen/otp_screen.dart';
import '../config.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.loginScreen, page: () =>  SignUpScreen()),
    GetPage(name: _routeName.signInScreen, page: () =>  SignInScreen()),
    GetPage(name: _routeName.otpScreen, page: () =>  OtpScreen()),
    GetPage(name: _routeName.numberScreen, page: () =>  NumberScreen()),
    GetPage(name: _routeName.homeScreen, page: () =>  HomeScreen()),
    GetPage(name: _routeName.facebookScreen, page: () =>  FbLoginScreen()),

  ];
}
