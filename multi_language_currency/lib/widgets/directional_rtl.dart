import '../config.dart';

class DirectionalRtl extends StatelessWidget {
  final Widget? child;
  const DirectionalRtl({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Directionality For RTL
    return Directionality(
        textDirection: appCtrl.isRTL || appCtrl.languageVal == 'ar'  ? TextDirection.rtl : TextDirection.ltr,
        child: child!
    );
  }
}