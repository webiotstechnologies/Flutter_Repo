import '../config.dart';

class ElevatedButtonCommon extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  const ElevatedButtonCommon({Key? key,this.title,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Elevated Button
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: appCtrl.appTheme.indigo),
        onPressed: onPressed,
        child: Text(title!,
            style: AppCss.montserratSemiBold14));
  }
}
