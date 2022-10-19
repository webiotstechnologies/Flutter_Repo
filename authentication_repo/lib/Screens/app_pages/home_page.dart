import '../../config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(appFonts.authentication,style: AppCss.montserratRegular18.textColor(appCtrl.appTheme.indigo)),
      ),
    );
  }
}
