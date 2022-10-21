import '../../../config.dart';

class SignUpLayout extends StatelessWidget {
  const SignUpLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpCtrl) {
      return Form(
          key: signUpCtrl.signUpGlobalKey,
          child: SingleChildScrollView(
              child: Column(children: [
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
                          .paddingOnly(bottom: Insets.i30,left: Insets.i65),
                    ])));
    });
  }
}
