import '../config.dart';
import 'dart:math' as math;

class ImageCommon extends StatelessWidget {
  final String? title;

  const ImageCommon({Key? key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius:
        const BorderRadius.all(Radius.circular(AppRadius.r20)),
        child: appCtrl.isRTL || appCtrl.languageVal == "ar" ?  Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Image.asset(title!,
                height: Sizes.s140, fit: BoxFit.cover, width: Sizes.s120)) : Image.asset(title!,
            height: Sizes.s140, fit: BoxFit.cover, width: Sizes.s120) );
  }
}
