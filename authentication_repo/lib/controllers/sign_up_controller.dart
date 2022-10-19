import 'package:authentication_repo/Screens/anonymous_method.dart';
import 'package:authentication_repo/config.dart';

class SignUpController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final RegExp digitRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final GlobalKey<FormState> signUpGlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> numberGlobalKey = GlobalKey<FormState>();
  final AuthService auth = AuthService();

  bool isLoading = false;

  onLoadingFalse () {
    isLoading = false;
    update();
  }

  onLoadingTrue () {
    isLoading = true;
    update();
  }

}