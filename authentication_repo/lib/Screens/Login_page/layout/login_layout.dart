import 'dart:developer';
import '../../../config.dart';
import '../../../controllers/sign_in_controller.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (signInCtrl) {
      return Form(
        key: signInCtrl.signInGlobalKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appFonts.email,
                        style: AppCss.montserratSemiBold16
                            .textColor(appCtrl.appTheme.blackColor)),
                    // Email
                    TextFieldCommon(
                      hintText: appFonts.enterEmail,
                      controller: signInCtrl.emailController,validator: (email) {
                      if (email.isEmpty) {
                        return appFonts.pleaseEnterEmail;
                      } else if (!signInCtrl.digitRegex.hasMatch(email)) {
                        return appFonts.pleaseEnterValid;
                      }
                      return null;
                    },),
                    const VSpace(Sizes.s40),
                    Text(appFonts.password,
                        style: AppCss.montserratSemiBold16
                            .textColor(appCtrl.appTheme.blackColor)),
                    // Password
                    TextFieldCommon(
                      hintText: appFonts.enterPassword,
                      controller: signInCtrl.passwordController,validator: (password) {
                      if (password.isEmpty) {
                        return appFonts.pleaseEnterPassword;
                      }
                      if (password.length < 8) {
                        return appFonts.passwordMustBe;
                      }
                      return null;
                    },)
                  ]
              ),
              ButtonCommon(title: appFonts.signIn,onTap: () async{
                if (signInCtrl.signInGlobalKey.currentState!.validate()) {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: signInCtrl.emailController.text.toString(),
                        password: signInCtrl.passwordController.text.toString()
                    );
                    Get.toNamed(routeName.homeScreen);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'wrong-password') {
                      log(e.toString());
                    } else if (e.code == 'user-not-found') {
                      log(e.toString());
                    }
                  }catch (e) {
                    log(e.toString());
                  }
                }
              },)
            ],
          ),
        ),
      );
    });
  }
}
