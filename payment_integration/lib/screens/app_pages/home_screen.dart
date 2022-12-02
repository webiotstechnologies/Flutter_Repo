import '../../config.dart';


class HomeScreen extends StatelessWidget {
  final homeCtrl = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: appCtrl.appTheme.indigo,
              centerTitle: true,
              title: Text(appFonts.paymentGetaway,
                  style: AppCss.montserratExtraBold18)),
          body: Form(
              key: homeCtrl.globalKey,
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    // Name Text
                    Text(appFonts.name,
                            style: AppCss.montserratSemiBold16
                                .textColor(appCtrl.appTheme.indigo))
                        .paddingOnly(bottom: Insets.i5),
                    // Name TextField
                    TextFieldCommon(
                            controller: homeCtrl.nameController,
                            validator: (name) =>
                                Validation().nameValidation(name),
                            hintText: appFonts.enterName)
                        .paddingOnly(bottom: Insets.i30),
                    // Email Text
                    Text(appFonts.email,
                            style: AppCss.montserratSemiBold16
                                .textColor(appCtrl.appTheme.indigo))
                        .paddingOnly(bottom: Insets.i5),
                    // Email TextField
                    TextFieldCommon(
                            controller: homeCtrl.emailController,
                            validator: (email) =>
                                Validation().emailValidation(email),
                            hintText: appFonts.enterEmail)
                        .paddingOnly(bottom: Insets.i30),
                    // Amount Text
                    Text(appFonts.amount,
                            style: AppCss.montserratSemiBold16
                                .textColor(appCtrl.appTheme.indigo))
                        .paddingOnly(bottom: Insets.i5),
                    // Amount TextField
                    TextFieldCommon(
                            controller: homeCtrl.amountController,
                            validator: (amount) =>
                                Validation().amountValidation(amount),
                            hintText: appFonts.enterAmount,
                            keyBoardType: TextInputType.number)
                        .paddingOnly(bottom: Insets.i30),
                    ButtonCommon(
                        title: appFonts.buy, onTap: () => homeCtrl.onBuy())
                  ]).paddingSymmetric(
                      horizontal: Insets.i20, vertical: Insets.i20))));
    });
  }
}
