import '../config.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.signUpScreen, page: () =>  SignUpScreen()),
    GetPage(name: _routeName.signInScreen, page: () =>  SignInScreen()),
    GetPage(name: _routeName.otpScreen, page: () =>  OtpScreen()),
    GetPage(name: _routeName.numberScreen, page: () =>  const NumberScreen()),
    GetPage(name: _routeName.facebookScreen, page: () =>   FbLogInLayout()),
    GetPage(name: _routeName.homeScreen, page: () =>  HomeScreen()),
    GetPage(name: _routeName.splashScreen, page: () =>  SplashScreen()),
    GetPage(name: _routeName.resetPasswordScreen, page: () =>   ResetPasswordScreen()),

  ];
}
