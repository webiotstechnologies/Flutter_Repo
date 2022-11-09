import 'package:flutter/cupertino.dart';
import '../config.dart';

class HeartImageCommon extends StatelessWidget {
  const HeartImageCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // Heart Icon
        child: Icon(CupertinoIcons.heart_fill,
                color: appCtrl.appTheme.error, size: Sizes.s14)
            .paddingAll(Insets.i4)
            .decorated(
                color: appCtrl.appTheme.whiteColor,
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppRadius.r50))));
  }
}
