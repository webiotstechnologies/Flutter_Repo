import 'dart:developer';
import '../../../config.dart';

class SignUpLayout extends StatelessWidget {
  const SignUpLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpCtrl) {
      return Form(
        key: signUpCtrl.signUpGlobalKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(appFonts.userName,
                    style: AppCss.montserratSemiBold16
                        .textColor(appCtrl.appTheme.blackColor)),
                // Username
                TextFieldCommon(
                    hintText: appFonts.enterUserName,
                    controller: signUpCtrl.usernameController,
                    validator: (username) {
                      if (username.isEmpty) {
                        return appFonts.pleaseEnterUsername;
                      }
                      return null;
                    }),
                const VSpace(Sizes.s40),
                Text(appFonts.email,
                    style: AppCss.montserratSemiBold16
                        .textColor(appCtrl.appTheme.blackColor)),
                // Email
                TextFieldCommon(
                  hintText: appFonts.enterEmail,
                  controller: signUpCtrl.emailController,
                  validator: (email) {
                    if (email.isEmpty) {
                      return appFonts.pleaseEnterEmail;
                    } else if (!signUpCtrl.digitRegex.hasMatch(email)) {
                      return appFonts.pleaseEnterValid;
                    }
                    return null;
                  },
                ),
                const VSpace(Sizes.s40),
                Text(appFonts.password,
                    style: AppCss.montserratSemiBold16
                        .textColor(appCtrl.appTheme.blackColor)),
                // Password
                TextFieldCommon(
                  hintText: appFonts.enterPassword,
                  controller: signUpCtrl.passwordController,
                  validator: (password) {
                    if (password.isEmpty) {
                      return appFonts.pleaseEnterPassword;
                    }
                    if (password.length < 8) {
                      return appFonts.passwordMustBe;
                    }
                    return null;
                  },
                ),
                const VSpace(Sizes.s10),
                Text(appFonts.forgotPass,
                        style: AppCss.montserratMedium16
                            .textColor(appCtrl.appTheme.indigo))
                    .inkWell(onTap: () => Get.toNamed(routeName.numberScreen))
              ]),
              ButtonCommon(
                title: appFonts.signUp,
                onTap: () async {
                  if (signUpCtrl.signUpGlobalKey.currentState!.validate()) {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: signUpCtrl.emailController.text.toString(),
                              password: signUpCtrl.passwordController.text
                                  .toString());

                      Get.toNamed(routeName.signInScreen);
                    } on FirebaseAuthException catch (e) {
                      log(e.toString());
                      if (e.code == 'wrong-password') {
                        log('Incorrect Password');
                      } else if (e.code == 'user-not-found') {
                        log('Email is not Found');
                      } else if (e.code == "email-already-in-use") {
                        log("Email Already In Use");
                      }
                    } catch (e) {
                      log("What Ever");
                    }
                  }
                },
              ),
              const VSpace(Sizes.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(eImageAssets.google, scale: 12).inkWell(
                      onTap: () async {
                    await signInWithGoogle();
                    Get.toNamed(routeName.homeScreen);
                    signUpCtrl.update();
                  }),
                  Image.asset(eImageAssets.facebook, scale: 12).inkWell(onTap: () => Get.toNamed(routeName.facebookScreen)),
                  Image.asset(eImageAssets.spyware,scale: 12).inkWell(
                      onTap: () async {
                       await signUpCtrl.auth.signInAnonymous();
                      }),
                ],
              ).paddingOnly(top: Insets.i30)
            ],
          ),
        ),
      );
    });
  }
}
