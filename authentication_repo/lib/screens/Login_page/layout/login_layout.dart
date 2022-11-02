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
              PasswordCommon(passController: signInCtrl.passwordController),
              const VSpace(Sizes.s10),
              // Forgot Password Text
              Text(appFonts.forgotPass,
                      style: AppCss.montserratMedium16
                          .textColor(appCtrl.appTheme.indigo))
                  .paddingOnly(left: Insets.i182)
                  .inkWell(onTap: ()=> Get.toNamed(routeName.resetPasswordScreen))
            ]),
            // SignIn Button
            ButtonCommon(
                title: appFonts.signIn, onTap: () => signInCtrl.signInMethod()),
            TextCommon(
                    title: appFonts.dontHaveAnAccount,
                    subTitle: appFonts.signUp,
                    onTap: () => Get.offAllNamed(routeName.signUpScreen))
                .paddingOnly(
                    top: Insets.i30, bottom: Insets.i30, left: Insets.i10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              // Google Image
              ImagesCommon(
                  image: eImageAssets.google,
                  onTap: () => signInCtrl.signInWithGoogle()),
              // Facebook Image
              ImagesCommon(
                  image: eImageAssets.facebook,
                  onTap: ()=> signInCtrl.signInWithFacebook(),
                  ),
              // Login With Phone
              ImagesCommon(
                  image: eImageAssets.phone,
                  onTap: ()=> Get.toNamed(routeName.numberScreen),
                  ),
              // Anonymous Login Image
              ImagesCommon(
                  image: eImageAssets.spyware,
                  onTap: () => signInCtrl.signInAnonymous())
            ]).paddingSymmetric(vertical: Insets.i20)
          ])));
    });
  }
}
