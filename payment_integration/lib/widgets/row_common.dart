import 'package:flutter/cupertino.dart';

import '../config.dart';

class RowCommon extends StatelessWidget {
  final String? title;
  const RowCommon({Key? key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Transaction row
    return Row(children: [
      Icon(CupertinoIcons.checkmark_alt_circle_fill,
          color: appCtrl.appTheme.green)
          .paddingOnly(right: Insets.i7),
      Text(title!,
          style: AppCss.montserratSemiBold14)
    ]);
  }
}
