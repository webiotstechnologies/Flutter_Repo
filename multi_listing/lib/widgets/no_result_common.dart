import '../config.dart';

class NoItemFound extends StatelessWidget {
  const NoItemFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // Icon
      const Icon(Icons.search_off),
      // Item Not Found Text
      Text(appFonts.itemNotFound,
          style: AppCss.montserratSemiBold14)
    ]);
  }
}
