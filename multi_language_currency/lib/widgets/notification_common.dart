import '../config.dart';

class NotificationCommon extends StatelessWidget {
  final int? number;

  const NotificationCommon({Key? key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      Container(
          // Notification Icon
          alignment: Alignment.center,
          child: Icon(Icons.notifications,
              size: 30, color: appCtrl.appTheme.indigo)),
      // Notification Popup
      Container(
              alignment: Alignment.center,
              height: Sizes.s10,
              width: Sizes.s10,
              decoration: BoxDecoration(
                  color: appCtrl.appTheme.error, shape: BoxShape.circle),
              child: Text("$number", style: AppCss.montserratSemiBold8))
          .paddingOnly(top: Insets.i15, right: Insets.i3)
    ]).paddingSymmetric(horizontal: Insets.i10);
  }
}
