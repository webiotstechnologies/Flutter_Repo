import '../../config.dart';

class SignInScreen extends StatelessWidget {
  final signInCtrl = Get.put(SignInController());

  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (_) {
      return Scaffold(
          backgroundColor: appCtrl.appTheme.indigo,
          body: signInCtrl.isLoading ? const AlertDialogBox() :Column(children: [
            // Sign In & Welcome Layout
            ExpandedTopCommon(title: appFonts.signIn),
            ExpandedBottomCommon(
              // LogIn Layout
                child: const LoginLayout()
                    .paddingSymmetric(horizontal: Insets.i30)
                    .paddingOnly(top: Insets.i70))
          ]));
    });
  }
}
