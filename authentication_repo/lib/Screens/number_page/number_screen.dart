import '../../config.dart';
import 'layout/number_layout.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (signUpCtrl) {
        return const Scaffold(
          body: NumberLayout(),
        );
      }
    );
  }
}
