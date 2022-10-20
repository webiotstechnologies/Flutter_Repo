import '../../../config.dart';
import '../../../widgets/image_common.dart';

class SignUpLayout extends StatelessWidget {
  const SignUpLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpCtrl) {
      return Form(
          key: signUpCtrl.signUpGlobalKey,
          child: SingleChildScrollView(
              child: signUpCtrl.isLoading
                  ? const AlertDialogBox()
                  : Column(children: [
                      // All Text Field layout
                      const SignUpFieldsCommon(),
                      // Sign Up Button
                      ButtonCommon(
                          title: appFonts.signUp,
                          onTap: () => signUpCtrl.signUpMethod()),
                      const VSpace(Sizes.s20),
                      TextCommon(
                              title: appFonts.haveAnAccount,
                              subTitle: appFonts.signIn,
                              onTap: () => Get.back())
                          .paddingOnly(bottom: Insets.i30),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Google Image
                            ImagesCommon(
                                image: eImageAssets.google,
                                onTap: () => signUpCtrl.signInWithGoogle()),
                            // Facebook Image
                            ImagesCommon(
                                image: eImageAssets.facebook,
                                onTap: () =>
                                    Get.toNamed(routeName.facebookScreen)),
                            // Anonymous Login Image
                            ImagesCommon(
                                image: eImageAssets.spyware,
                                    onTap: () => signUpCtrl.signInAnonymous()),
                          ]).paddingSymmetric(vertical: Insets.i20)
                    ])));
    });
  }
}
