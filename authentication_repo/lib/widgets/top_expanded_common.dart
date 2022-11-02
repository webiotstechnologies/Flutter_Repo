import '../config.dart';

class ExpandedTopCommon extends StatelessWidget {
  final String? title;

  const ExpandedTopCommon({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Common Top Expanded For SignIn & SignUp Pages
    return Expanded(
        flex: 5,
        child: Container(
            width: double.infinity,
            color: appCtrl.appTheme.indigo,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Welcome Text
              Text(appFonts.welcome,
                      style: AppCss.montserratMedium16
                          .textColor(appCtrl.appTheme.lightBg))
                  .paddingSymmetric(vertical: Sizes.s5),
              // Common Text
              Text(title!,
                  style: AppCss.montserratMedium28
                      .textColor(appCtrl.appTheme.whiteColor))
            ])
                    .paddingSymmetric(horizontal: Insets.i30)
                    .paddingOnly(top: Insets.i90)));
  }
}
