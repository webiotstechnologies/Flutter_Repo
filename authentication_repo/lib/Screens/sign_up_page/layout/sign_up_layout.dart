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
                const VSpace(Sizes.s40),
                Text(appFonts.number,
                    style: AppCss.montserratSemiBold16
                        .textColor(appCtrl.appTheme.blackColor)),
                TextFieldCommon(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  hintText: appFonts.enterNumber,
                  controller: signUpCtrl.numberController,
                  validator: (password) {
                    if (password.isEmpty) {
                      return appFonts.enterValidNumber;
                    }
                    if (password.length < 10) {
                      return appFonts.enterValidNumber;
                    }
                    return null;
                  },
                ),
              ]),
              ButtonCommon(
                title: appFonts.signUp,
                onTap: () async {
                  if (signUpCtrl.signUpGlobalKey.currentState!.validate()) {
                    Get.toNamed(routeName.otpScreen);
                    /*try {
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
                    }*/
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(eImageAssets.google, scale: 15).inkWell(
                      onTap: () async {
                    await signInWithGoogle();
                    Get.toNamed(routeName.signInScreen);
                    signUpCtrl.update();
                  }),
                  Image.asset(eImageAssets.facebook, scale: 15),
                  Image.asset(eImageAssets.twitter, scale: 15),
                ],
              ).paddingOnly(top: Insets.i50)
            ],
          ),
        ),
      );
    });
  }
}
