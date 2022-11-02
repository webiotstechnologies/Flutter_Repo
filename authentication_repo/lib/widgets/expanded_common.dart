import '../config.dart';

class ExpandedBottomCommon extends StatelessWidget {
  final Widget? child;
  const ExpandedBottomCommon({Key? key,this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Common Bottom Expanded For SignIn & SignUp Pages
    return Expanded(
        flex: 13,
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: appCtrl.appTheme.whiteColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(Sizes.s30),
                    topLeft: Radius.circular(Sizes.s30))),
            child: child
        ));
  }
}
