import '../../config.dart';

class SignUpScreen extends StatelessWidget {
  final signUpCtrl = Get.put(SignUpController());

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (_) {
      return Scaffold(
          backgroundColor: appCtrl.appTheme.indigo,
          body: Column(children: [
            // Sign Up & Welcome Layout
            ExpandedTopCommon(title: appFonts.signUp),
            // SignUp Bottom Layout
            ExpandedBottomCommon(
                child: const SignUpLayout()
                    .paddingSymmetric(horizontal: Insets.i30)
                    .paddingOnly(top: Insets.i70))
          ]));
    });
  }
}
