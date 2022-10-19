import 'package:authentication_repo/config.dart';

class OtpController extends GetxController {
  final GlobalKey<FormState> otpGlobalKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  RegExp regex = RegExp("^([0-9]{4}|[0-9]{6})");
  final data = Get.arguments;
  FirebaseAuth auth = FirebaseAuth.instance;
}