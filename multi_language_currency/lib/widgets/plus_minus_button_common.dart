import '../config.dart';

class PlusMinusCommon extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  const PlusMinusCommon({Key? key,this.icon,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Icon Button Plus Minus
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
         icon,
          size: 30,
          color: appCtrl.appTheme.indigo
        ));
  }
}
