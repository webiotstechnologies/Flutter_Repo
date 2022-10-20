import '../../../config.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (signInCtrl) {
      return Form(
          key: signInCtrl.signInGlobalKey,
          child: SingleChildScrollView(
              child: Column(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Email Field
              EmailCommon(emailController: signInCtrl.emailController),
              const VSpace(Sizes.s40),
              // Password Field
              PasswordCommon(passController: signInCtrl.passwordController)
            ]),
            // SignIn Button
            ButtonCommon(
                title: appFonts.signIn, onTap: () => signInCtrl.signInMethod()),
            TextCommon(title: appFonts.dontHaveAnAccount,subTitle: appFonts.signUp ,onTap: () => Get.toNamed(routeName.signUpScreen))
                .paddingOnly(top: Insets.i30)
          ])));
    });
  }
}
