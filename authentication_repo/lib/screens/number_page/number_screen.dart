import '../../config.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // Number Field Layout
        body: NumberLayout()
    );
  }
}
